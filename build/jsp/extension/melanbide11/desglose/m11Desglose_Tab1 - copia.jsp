<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
<%@page import="es.altia.agora.business.escritorio.UsuarioValueObject" %>
<%@page import="es.altia.common.service.config.Config"%>
<%@page import="es.altia.common.service.config.ConfigServiceHelper"%>
<%@page import="es.altia.flexia.integracion.moduloexterno.melanbide11.i18n.MeLanbide11I18n" %>
<%@page import="es.altia.flexia.integracion.moduloexterno.melanbide11.util.ConfigurationParameter"%>
<%@page import="es.altia.flexia.integracion.moduloexterno.melanbide11.util.ConstantesMeLanbide11"%>
<%@page import="es.altia.flexia.integracion.moduloexterno.melanbide11.vo.ContratacionVO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Fragmento simplificado: se elimina estructura html/head/body para inline dentro de contenedor --%>
<div style="padding:6px 8px 4px 8px;">
    <%
      UsuarioValueObject usuarioVO = new UsuarioValueObject();
      int idiomaUsuario = 1;
      int apl = 5;
      String css = "";
      if (session.getAttribute("usuario") != null){
          usuarioVO = (UsuarioValueObject) session.getAttribute("usuario");
          apl = usuarioVO.getAppCod();
          idiomaUsuario = usuarioVO.getIdioma();
          css = usuarioVO.getCss();
      }

  MeLanbide11I18n meLanbide11I18n = MeLanbide11I18n.getInstance();
      String numExpediente = (String)request.getAttribute("numExp");

      // Par�metros opcionales (modo alta/modificaci�n)
      String nuevo       = request.getAttribute("nuevo") != null ? (String)request.getAttribute("nuevo") : "1";
      String idRegistro  = request.getAttribute("id")    != null ? (String)request.getAttribute("id")    : "";

      // Valores iniciales opcionales (si vienes a modificar)
      String vSalBase  = request.getAttribute("salarioBase") != null ? ((String)request.getAttribute("salarioBase")).replace(".", ",") : "";
      String vPagas    = request.getAttribute("pagasExtra")  != null ? ((String)request.getAttribute("pagasExtra")).replace(".", ",")  : "";
  String vCompImp  = request.getAttribute("compImporte") != null ? ((String)request.getAttribute("compImporte")).replace(".", ",") : "";
  String vCompTipo = request.getAttribute("compTipo")    != null ? (String)request.getAttribute("compTipo") : "";
  String vCompExtra = request.getAttribute("compExtra")  != null ? ((String)request.getAttribute("compExtra")).replace(".", ",") : ""; // nuevo: valor complementos extrasalariales
    %>
    <jsp:useBean id="descriptor" scope="request" class="es.altia.agora.interfaces.user.web.util.TraductorAplicacionBean"  type="es.altia.agora.interfaces.user.web.util.TraductorAplicacionBean" />
    <jsp:setProperty name="descriptor"  property="idi_cod" value="<%=idiomaUsuario%>" />
    <jsp:setProperty name="descriptor"  property="apl_cod" value="<%=apl%>" />

    <%-- Cabecera visual se muestra ahora en el contenedor principal --%>

  <%-- Dependencias ya deber�an estar cargadas por el contenedor. Si no, reintroducir enlaces arriba. --%>

    <script type="text/javascript">
      var APP_CONTEXT_PATH = '<%=request.getContextPath()%>';
      var url = APP_CONTEXT_PATH + '/PeticionModuloIntegracion.do';
      var mensajeValidacion = '';

      // Fallback: si la funci�n global elementoVisible (definida en JavaScriptUtil.js) no est� cargada
      if (typeof elementoVisible === 'undefined') {
        function elementoVisible(accion, idBarra){
          try {
            var el = document.getElementById(idBarra);
            if(!el) return;
            if(accion=='on' || accion=='mostrar') el.style.display=''; 
            else if(accion=='off' || accion=='ocultar') el.style.display='none';
          } catch(e) {}
        }
      }

      // Fallback para jsp_alerta si no est� disponible
      if (typeof jsp_alerta === 'undefined') {
        function jsp_alerta(tipo, mensaje) {
          if (tipo === '') {
            return confirm(mensaje) ? 1 : 0;
          } else {
            alert(mensaje);
          }
        }
      }

      // Fallback para mostrarErrorPeticion si no est� disponible
      if (typeof mostrarErrorPeticion === 'undefined') {
        function mostrarErrorPeticion(codigo) {
          console.error("Error en petici�n AJAX, c�digo:", codigo);
          alert("Error en la comunicaci�n con el servidor");
        }
      }

      // Funci�n reemplazarPuntos requerida por los campos num�ricos
      function reemplazarPuntos(campo) {
        try {
          var valor = campo.value;
          if (valor != null && valor != '') {
            valor = valor.replace(/\./g, ',');
            campo.value = valor;
          }
        } catch (err) {
          console.warn('Error en reemplazarPuntos:', err);
        }
      }

      // Funci�n validarNumeroReal requerida por los campos num�ricos
      function validarNumeroReal(campo) {
        try {
          if (!campo || !campo.value || campo.value.trim() === '') {
            return true; // Los campos vac�os se permiten
          }
          
          var valor = campo.value.replace(',', '.'); // Convertir formato espa�ol a decimal
          var numero = parseFloat(valor);
          
          if (isNaN(numero) || !isFinite(numero)) {
            return false;
          }
          
          // Validar que sea positivo para campos monetarios
          if (numero < 0) {
            return false;
          }
          
          return true;
        } catch (e) {
          console.warn('Error validando campo num�rico:', e);
          return false;
        }
      }

      function validarDesglose(){
        mensajeValidacion='';
        var sal=document.getElementById('rsbSalBase');
        if(sal.value && !validarNumeroReal(sal)){
            mensajeValidacion='Salario base: formato inv�lido.';
            return false;
        }
        
        var pag=document.getElementById('rsbPagasExtra');
        if(pag.value && !validarNumeroReal(pag)){
            mensajeValidacion='Pagas extraordinarias: formato inv�lido.';
            return false;
        }
        
        var imp=document.getElementById('rsbCompImporte');
        if(imp.value && !validarNumeroReal(imp)){
            mensajeValidacion='Complementos salariales: formato inv�lido.';
            return false;
        }
        
        var impExtra=document.getElementById('rsbCompExtra');
        if(impExtra.value && !validarNumeroReal(impExtra)){
            mensajeValidacion='Complementos extrasalariales: formato inv�lido.';
            return false;
        }
        return true;
      }

      function guardarDesglose(){
        if(!validarDesglose()){
          jsp_alerta('A', mensajeValidacion);
          return;
        }
        elementoVisible('on', 'barraProgresoLPEEL');

        var rsbSalBase = document.getElementById('rsbSalBase').value;
        var rsbPagasExtra = document.getElementById('rsbPagasExtra').value;
        var rsbCompImporte = document.getElementById('rsbCompImporte').value;
        var rsbCompExtra = document.getElementById('rsbCompExtra').value;

        var parametros = "tarea=preparar&modulo=MELANBIDE11&operacion=guardarDesgloseRSB&tipo=0"
          + "&idRegistro=" + encodeURIComponent('<%=idRegistro%>')
          + "&rsbSalBase=" + encodeURIComponent(rsbSalBase)
          + "&rsbPagasExtra=" + encodeURIComponent(rsbPagasExtra)
          + "&rsbCompImporte=" + encodeURIComponent(rsbCompImporte)
          + "&rsbCompExtra=" + encodeURIComponent(rsbCompExtra);

        try{
          $.ajax({
            url: url,
            type: 'POST',
            async: true,
            data: parametros,
            success: procesarRespuestaGuardar,
            error: mostrarErrorGuardar
          });
        }catch(err){
          elementoVisible('off', 'barraProgresoLPEEL');
          mostrarErrorPeticion();
        }
      }

      function procesarRespuestaGuardar(ajaxResult){
        elementoVisible('off', 'barraProgresoLPEEL');
        try{
          var datos = JSON.parse(ajaxResult);
          // Nuevo JSON: {resultado:{codigoOperacion:"0", salariales: n, extrasalariales: m}}
          var codigoOperacion = datos && datos.resultado ? datos.resultado.codigoOperacion : "4";
          if (codigoOperacion == "0"){
            console.log("Desglose RSB guardado exitosamente - cerrando modal");
            // Actualizar (si existiera) resumen de totales en UI
            jsp_alerta('I', 'Guardado correcto');
            // Pasar resultado al padre antes de cerrar
            try {
              if (window.opener && window.opener.modalCallback) {
                window.opener.modalCallback(['0', 'Desglose RSB guardado exitosamente']);
              } else if (window.parent && window.parent.modalCallback) {
                window.parent.modalCallback(['0', 'Desglose RSB guardado exitosamente']);
              }
            } catch(e) {
              console.warn("No se pudo pasar resultado al padre:", e);
            }
            // Cerrar modal despu�s de guardar exitosamente
            setTimeout(function() {
              cerrarVentana(['0', 'Desglose RSB guardado exitosamente']);
            }, 1500); // Delay de 1.5 segundos para que el usuario vea el mensaje
          } else if (codigoOperacion == "1") {
            jsp_alerta('A', document.getElementById('errorBD').value);
          } else if (codigoOperacion == "3") {
            jsp_alerta('A', 'Par�metros insuficientes');
          } else {
            jsp_alerta('A', document.getElementById('generico').value);
          }
        }catch(e){
          jsp_alerta('A', document.getElementById('generico').value);
        }
      }

      function mostrarErrorGuardar(){
        elementoVisible('off', 'barraProgresoLPEEL');
        mostrarErrorPeticion(7);
      }

      window.guardarDesglose = function(){
        console.log("=== EJECUTANDO GUARDAR DESGLOSE ===");
        if(!validarDesglose()){
          console.log("Validaci�n fall�:", mensajeValidacion);
          jsp_alerta('A', mensajeValidacion);
          return;
        }
        elementoVisible('on', 'barraProgresoLPEEL');

        var rsbSalBase = document.getElementById('rsbSalBase').value;
        var rsbPagasExtra = document.getElementById('rsbPagasExtra').value;
        var rsbCompImporte = document.getElementById('rsbCompImporte').value;
        var rsbCompExtra = document.getElementById('rsbCompExtra').value;

        console.log("Valores a guardar:", {rsbSalBase, rsbPagasExtra, rsbCompImporte, rsbCompExtra});

        var parametros = "tarea=preparar&modulo=MELANBIDE11&operacion=guardarDesgloseRSB&tipo=0"
          + "&idRegistro=" + encodeURIComponent('<%=idRegistro%>')
          + "&rsbSalBase=" + encodeURIComponent(rsbSalBase)
          + "&rsbPagasExtra=" + encodeURIComponent(rsbPagasExtra)
          + "&rsbCompImporte=" + encodeURIComponent(rsbCompImporte)
          + "&rsbCompExtra=" + encodeURIComponent(rsbCompExtra);

        try{
          $.ajax({
            url: url,
            type: 'POST',
            async: true,
            data: parametros,
            success: procesarRespuestaGuardar,
            error: mostrarErrorGuardar
          });
        }catch(err){
          console.error("Error en AJAX:", err);
          elementoVisible('off', 'barraProgresoLPEEL');
          mostrarErrorPeticion();
        }
      }

      window.cancelar = function(){
        console.log("=== EJECUTANDO CANCELAR DESGLOSE ===");
        try{
          if (window.skipCancelConfirm) { // llamado desde volverDesglose(): no duplicar confirmaci�n
            cerrarVentana();
            return;
          }
        }catch(e){}
        var r = jsp_alerta('', '<%=meLanbide11I18n.getMensaje(idiomaUsuario, "msg.preguntaCancelar")%>');
        if(r == 1){ cerrarVentana(); } // Sin resultado al cancelar
      }

      // Verificar que las funciones se han registrado correctamente
      console.log("=== FUNCIONES REGISTRADAS EN TAB1 ===");
      console.log("window.guardarDesglose:", typeof window.guardarDesglose);
      console.log("window.cancelar:", typeof window.cancelar);

      // Funci�n de eliminaci�n espec�fica para Tab1
      window.m11_eliminarTab1 = function() {
        console.log("=== ELIMINANDO DESDE TAB1 ===");
        
        var idRegistro = document.getElementById('idRegistroContratacion');
        if (!idRegistro || !idRegistro.value || idRegistro.value.trim() === '') {
          if (typeof jsp_alerta === 'function') {
            jsp_alerta('A', 'No hay registro seleccionado para eliminar.');
          } else {
            alert('No hay registro seleccionado para eliminar.');
          }
          return false;
        }
        
        var id = idRegistro.value.trim();
        console.log("Eliminando registro con ID:", id);
        
        // Mostrar progreso
        elementoVisible('on', 'barraProgresoLPEEL');
        
        var parametros = "tarea=preparar&modulo=MELANBIDE11&operacion=eliminarContratacionAJAX&tipo=0"
          + "&id=" + encodeURIComponent(id)
          + "&numExp=" + encodeURIComponent('<%=numExpediente%>');
        
        try {
          $.ajax({
            url: url,
            type: 'POST',
            async: true,
            data: parametros,
            success: function(ajaxResult) {
              elementoVisible('off', 'barraProgresoLPEEL');
              try {
                var datos = JSON.parse(ajaxResult);
                var codigoOperacion = datos && datos.resultado ? datos.resultado.codigoOperacion : "4";
                
                if (codigoOperacion == "0") {
                  console.log("Registro eliminado exitosamente");
                  jsp_alerta('I', 'Registro eliminado correctamente');
                  
                  // Limpiar formulario
                  limpiarFormularioTab1();
                  
                  // Deshabilitar bot�n eliminar
                  if (typeof window.habilitarBotonEliminar === 'function') {
                    window.habilitarBotonEliminar(false);
                  }
                  
                  // Recargar lista si existe
                  if (typeof window.m11_cargarContrataciones === 'function') {
                    setTimeout(window.m11_cargarContrataciones, 500);
                  }
                  
                } else {
                  var mensaje = datos && datos.resultado && datos.resultado.mensajeOperacion 
                    ? datos.resultado.mensajeOperacion 
                    : "Error al eliminar el registro";
                  jsp_alerta('A', mensaje);
                }
              } catch(e) {
                console.error("Error procesando respuesta de eliminaci�n:", e);
                jsp_alerta('A', 'Error al procesar la respuesta del servidor');
              }
            },
            error: function(xhr, status, error) {
              elementoVisible('off', 'barraProgresoLPEEL');
              console.error("Error en AJAX de eliminaci�n:", error);
              jsp_alerta('A', 'Error de comunicaci�n con el servidor');
            }
          });
        } catch(err) {
          console.error("Error en eliminaci�n:", err);
          elementoVisible('off', 'barraProgresoLPEEL');
          jsp_alerta('A', 'Error al eliminar el registro');
        }
        
        return true;
      };
      
      // Funci�n para limpiar el formulario Tab1
      function limpiarFormularioTab1() {
        try {
          document.getElementById('idRegistroContratacion').value = '';
          document.getElementById('rsbSalBase').value = '';
          document.getElementById('rsbPagasExtra').value = '';
          document.getElementById('rsbCompImporte').value = '';
          document.getElementById('rsbCompExtra').value = '';
        } catch(e) {
          console.warn("Error limpiando formulario Tab1:", e);
        }
      }
      
      // Funci�n para detectar cambios y habilitar/deshabilitar bot�n eliminar
      function verificarRegistroSeleccionado() {
        var idRegistro = document.getElementById('idRegistroContratacion');
        var hayRegistro = idRegistro && idRegistro.value && idRegistro.value.trim() !== '';
        
        if (typeof window.habilitarBotonEliminar === 'function') {
          window.habilitarBotonEliminar(hayRegistro);
        }
        
        return hayRegistro;
      }
      
      // A�adir listeners para detectar cambios en el ID del registro
      try {
        var idInput = document.getElementById('idRegistroContratacion');
        if (idInput) {
          idInput.addEventListener('change', verificarRegistroSeleccionado);
          idInput.addEventListener('input', verificarRegistroSeleccionado);
        }
      } catch(e) {
        console.warn("Error a�adiendo listeners:", e);
      }
      
      // Verificar estado inicial
      setTimeout(verificarRegistroSeleccionado, 100);

      // Funci�n para cerrar ventana del modal de desglose RSB
      function cerrarVentana(resultado) {
        console.log("=== CERRANDO MODAL DESGLOSE RSB ===");
        console.log("Resultado a pasar:", resultado);
        try {
          var ventanaCerrada = false;
          
          // Pasar resultado antes de cerrar si se proporciona
          if (resultado) {
            try {
              if (window.opener && typeof window.opener === 'object') {
                console.log("Pasando resultado al opener");
                window.returnValue = resultado;
                if (window.opener.modalCallback) {
                  window.opener.modalCallback(resultado);
                }
              } else if (window.parent && window.parent !== window.self) {
                console.log("Pasando resultado al parent");
                window.returnValue = resultado;
                if (window.parent.modalCallback) {
                  window.parent.modalCallback(resultado);
                }
              }
            } catch(e) {
              console.warn("Error pasando resultado:", e);
            }
          }
          
          // M�todo 1: Ventana modal o popup tradicional
          if (window.opener && !window.parent.opener) {
            console.log("M�todo 1: Ventana popup - cerrando con window.close()");
            window.close();
            ventanaCerrada = true;
          }
          
          // M�todo 2: Ventana dentro de un iframe o frame
          else if (window.parent && window.parent !== window.self) {
            console.log("M�todo 2: Ventana en frame/iframe");
            
            // Intentar cerrar desde el parent
            if (window.parent.window && typeof window.parent.window.close === 'function') {
              console.log("Cerrando desde window.parent.window.close()");
              window.parent.window.close();
              ventanaCerrada = true;
            }
            // Fallback: cerrar ventana actual
            else {
              console.log("Fallback frame: cerrando ventana actual");
              window.close();
              ventanaCerrada = true;
            }
          }
          
          // M�todo 3: Fallback general para navegadores modernos
          if (!ventanaCerrada) {
            console.log("M�todo 3: Fallback general");
            if (window.close) {
              window.close();
              ventanaCerrada = true;
            }
          }
          
          // M�todo 4: Si a�n no se ha cerrado, intentar redirecci�n
          if (!ventanaCerrada) {
            console.log("M�todo 4: �ltimo recurso - recargar p�gina padre");
            if (window.parent && window.parent.location && window.parent.location.reload) {
              setTimeout(function() {
                window.parent.location.reload();
              }, 100);
            } else if (window.opener && window.opener.location && window.opener.location.reload) {
              setTimeout(function() {
                window.opener.location.reload();
                window.close();
              }, 100);
            }
          }
          
          console.log("=== MODAL DESGLOSE RSB CERRADO ===");
          
        } catch(e) {
          console.error("Error cerrando modal desglose RSB:", e);
          // Fallback final
          try {
            window.close();
          } catch(e2) {
            console.error("Error en fallback:", e2);
          }
        }
      }

      /*
      ================================================
      C�DIGO CRUD CONTRATACIONES COMENTADO - NO SE USA
      (Secci�n "Listado de contrataciones existentes" removida)
      ================================================
      // =====================
      // CRUD CONTRATACIONES (PESTA�A 1 - DESGLOSE RSB)
      // =====================
      (function(){
          if(window.m11_contratacionesInicializado){return;} // evitar doble init si JSP se incluye 2 veces
          window.m11_contratacionesInicializado = true;

          function qs(id){return document.getElementById(id);}  
          function msg(t){var d=qs('crudContMensaje'); if(d){d.textContent=t||'';} }
          function habilitarEliminar(si){var b=qs('btnEliminarCont'); if(b){b.disabled=!si;}}

          window.m11_cargarContrataciones = function(){
              msg('Cargando...');
              habilitarEliminar(false);
              var numExp = '<%=numExpediente%>';
              console.log('Cargando contrataciones para expediente:', numExp);
              
              if(!numExp || numExp === 'null' || numExp === '') {
                  msg('Error: N�mero de expediente no disponible');
                  renderTabla([]);
                  return;
              }
              
              var url = APP_CONTEXT_PATH + '/PeticionModuloIntegracion.do?tarea=preparar&modulo=MELANBIDE11&operacion=listarContratacionesAJAX&tipo=0&numExp='+ encodeURIComponent(numExp) + '&id=0';
              console.log('URL de petici�n:', url);
              
              fetch(url, {cache:'no-cache'})
                  .then(r=>{
                      console.log('Respuesta HTTP:', r.status, r.statusText);
                      if(!r.ok) {
                          return r.text().then(errorText => {
                              console.error('Error en respuesta:', errorText);
                              throw new Error('HTTP ' + r.status + ': ' + r.statusText);
                          });
                      }
                      return r.json();
                  })
                  .then(json=>{
                      console.log('Respuesta JSON recibida:', json);
                      if(!json) {
                          msg('Error: Respuesta vac�a del servidor');
                          renderTabla([]);
                          return;
                      }
                      if(json.error) {
                          msg('Error del servidor: ' + json.error);
                          renderTabla([]);
                          return;
                      }
                      if(!json.contrataciones){
                          console.log('Sin contrataciones en la respuesta');
                          msg('Sin datos'); 
                          renderTabla([]); 
                          return;
                      }
                      window.m11_cacheContrataciones = json.contrataciones; // cachear para selecci�n
                      renderTabla(json.contrataciones);
                      msg(json.contrataciones.length + ' registro(s).');
                  })
                  .catch(err=>{
                      console.error('Error completo en listarContratacionesAJAX:', err);
                      msg('Error cargando listado: ' + err.message); 
                      renderTabla([]);
                  });
          };

          function renderTabla(lista){
              var cont = qs('tablaContrataciones');
              if(!cont){return;}
              if(!lista || lista.length===0){cont.innerHTML='<div style="padding:6px; font-size:12px;">(Sin registros)</div>'; return;}
              
              var html = ['<table style="width:100%; border-collapse:collapse; font-size:11px;">'];
              html.push('<thead><tr style="background:#e9ecef;">'
                  + '<th style="border:1px solid #ccc; padding:4px;">ID</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">DNI</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">Nombre</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">Puesto</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">Salario Base</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">Pagas Extra</th>'
                  + '<th style="border:1px solid #ccc; padding:4px;">Compl. Salariales</th>'
                  + '</tr></thead><tbody>');
              
              for(var i=0;i<lista.length;i++){
                  var r = lista[i];
                  var id = (r.id!=null?r.id:'');
                  var dni = (r.dni||'');
                  var nombre = ((r.nombre||'') + ' ' + (r.apellido1||'') + ' ' + (r.apellido2||'')).trim();
                  var puesto = (r.puesto||'');
                  var salBase = (r.rsbSalBase||'');
                  var pagExtra = (r.rsbPagExtra||'');
                  var compConv = (r.rsbCompConv||'');
                  
                  html.push('<tr style="cursor:pointer;" onclick="m11_seleccionarContratacion('+i+')" onmouseover="this.style.backgroundColor=\'#f5f5f5\'" onmouseout="this.style.backgroundColor=\'\'">');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+id+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+dni+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+nombre+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+puesto+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+salBase+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+pagExtra+'</td>');
                  html.push('<td style="border:1px solid #ddd; padding:4px;">'+compConv+'</td>');
                  html.push('</tr>');
              }
              html.push('</tbody></table>');
              cont.innerHTML = html.join('');
          }

          window.m11_seleccionarContratacion = function(index){
              if(!window.m11_cacheContrataciones || index<0 || index>=window.m11_cacheContrataciones.length) return;
              var reg = window.m11_cacheContrataciones[index];
              rellenarFormularioDesdeRegistro(reg);
              habilitarEliminar(true);
              msg('Registro seleccionado - ID: '+(reg.id||''));
          };

          function rellenarFormularioDesdeRegistro(reg){
              qs('idRegistroContratacion').value = reg.id||'';
              // Rellenar campos de desglose RSB con los valores de la contrataci�n seleccionada
              if(qs('rsbSalBase')) qs('rsbSalBase').value = reg.rsbSalBase||'';
              if(qs('rsbPagasExtra')) qs('rsbPagasExtra').value = reg.rsbPagExtra||'';
              if(qs('rsbCompImporte')) qs('rsbCompImporte').value = reg.rsbCompConv||'';
              if(qs('rsbCompExtra')) qs('rsbCompExtra').value = reg.rsbCompExtra||'';
          }

          window.m11_nuevaContratacionFormulario = function(){
              // Limpiar formulario para nuevo registro
              qs('idRegistroContratacion').value = '';
              var campos = ['rsbSalBase','rsbPagasExtra','rsbCompImporte','rsbCompExtra'];
              for(var i=0; i<campos.length; i++){
                  var campo = qs(campos[i]);
                  if(campo) campo.value = '';
              }
              habilitarEliminar(false);
              msg('Nuevo registro - complete los datos y guarde');
          };

          window.m11_eliminarContratacionSeleccionada = function(){
              var id = qs('idRegistroContratacion').value;
              if(!id) {msg('No hay registro seleccionado para eliminar'); return;}
              
              if(!confirm('�Est� seguro de eliminar la contrataci�n con ID: '+id+'?')) return;
              
              msg('Eliminando...');
              var numExp = '<%=numExpediente%>';
              var url = APP_CONTEXT_PATH + '/PeticionModuloIntegracion.do?tarea=preparar&modulo=MELANBIDE11&operacion=eliminarContratacionAJAX&tipo=0&numExp='+ encodeURIComponent(numExp||'') + '&id=' + encodeURIComponent(id);
              
              fetch(url, {cache:'no-cache'})
                  .then(r=>r.ok?r.json():Promise.reject(r.status))
                  .then(json=>{
                      if(json && json.resultado && json.resultado.codigoOperacion === 0){
                          msg('Eliminado correctamente');
                          m11_nuevaContratacionFormulario(); // limpiar formulario
                          m11_cargarContrataciones(); // recargar lista
                      } else {
                          msg('Error al eliminar: ' + (json.resultado?.mensajeOperacion || 'Error desconocido'));
                      }
                  })
                  .catch(err=>{console.error('Error eliminarContratacionAJAX',err); msg('Error eliminando registro');});
          };

          // Modificar la funci�n guardarDesglose para que tambi�n guarde la informaci�n de contrataci�n
          // Nota: Se ha eliminado la redefinici�n de window.guardarDesglose aqu� para evitar duplicidades.

          // Cargar lista inicial cuando el DOM est� listo
          if(document.readyState === 'loading'){
              document.addEventListener('DOMContentLoaded', function(){
                  setTimeout(m11_cargarContrataciones, 100);
              });
          } else {
              setTimeout(m11_cargarContrataciones, 100);
          }

      })(); // fin IIFE CRUD CONTRATACIONES
      ================================================
      FIN C�DIGO CRUD CONTRATACIONES COMENTADO
      ================================================
      */
    </script>
    <div>
  <input type="hidden" id="errorBD" name="errorBD" value="<%=meLanbide11I18n.getMensaje(idiomaUsuario,"error.errorBD")%>"/>
  <input type="hidden" id="generico" name="generico" value="<%=meLanbide11I18n.getMensaje(idiomaUsuario,"error.generico")%>"/>

  <div id="barraProgresoLPEEL" style="visibility:hidden;display:none;">
        <div class="contenedorHidepage">
          <div class="textoHide">
            <span><%=meLanbide11I18n.getMensaje(idiomaUsuario, "msg.procesando")%></span>
          </div>
          <div class="imagenHide">
            <span id="disco" class="fa fa-spinner fa-spin" aria-hidden="true"></span>
          </div>
        </div>
          <div style="text-align:center; margin:14px 0 6px 0;">
            <!-- Bot�n Volver movido al JSP principal (m11Desglose.jsp) -->
          </div>
      </div>

      <form>
        <input type="hidden" id="idRegistroContratacion" name="idRegistroContratacion" value="<%=idRegistro%>" />
        <div style="width:100%; padding:4px 2px 2px 2px; text-align:left;">
          <%-- Cabecera ya incluida arriba (H1 + expediente) --%>

          <div class="lineaFormulario" style="padding-top:4px;">
            <div class="etiquetaLPEEL">Salario base (Oinarrizko soldata)</div>
            <div class="campoFormulario">
              <input id="rsbSalBase" name="rsbSalBase" type="text" class="inputTexto" size="10" maxlength="10"
                     onchange="reemplazarPuntos(this);" onblur="validarNumeroReal(this);" value="<%=vSalBase%>" />
            </div>
          </div>

          <div class="lineaFormulario" style="padding-top:10px;">
            <div class="etiquetaLPEEL">Pagas extraordinarias (Aparteko ordainsariak)</div>
            <div class="campoFormulario">
              <input id="rsbPagasExtra" name="rsbPagasExtra" type="text" class="inputTexto" size="10" maxlength="10"
                     onchange="reemplazarPuntos(this);" onblur="validarNumeroReal(this);" value="<%=vPagas%>" />
            </div>
          </div>

          <div class="lineaFormulario" style="padding-top:10px;">
            <div class="etiquetaLPEEL">Complementos salariales (Soldata-osagarriak)</div>
            <div class="campoFormulario">
              <input id="rsbCompImporte" name="rsbCompImporte" type="text" class="inputTexto" size="10" maxlength="10"
                     onchange="reemplazarPuntos(this);" onblur="validarNumeroReal(this);" value="<%=vCompImp%>" />
            </div>
          </div>

          <%-- Campo Concepto FIJO/VARIABLE eliminado seg�n nuevo dise�o --%>

          <div class="lineaFormulario" style="padding-top:10px;">
            <div class="etiquetaLPEEL">Complementos extrasalariales</div>
            <div class="campoFormulario">
              <input id="rsbCompExtra" name="rsbCompExtra" type="text" class="inputTexto" size="10" maxlength="10"
                     onchange="reemplazarPuntos(this);" onblur="validarNumeroReal(this);" value="<%=vCompExtra%>" />
            </div>
          </div>
          <!-- Complementos extrasalariales son informativos; no se guardan en este endpoint -->

          <!-- Botonera movida al contenedor principal (fuera de las pesta�as) -->

        </div>
      </form>
    </div>
</div>
