<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> <%@ taglib
uri="/WEB-INF/struts-bean.tld" prefix="bean" %> <%@ taglib
uri="/WEB-INF/tlds/c.tld" prefix="c" %> <%@ page contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="es.altia.flexia.integracion.moduloexterno.melanbide11.i18n.MeLanbide11I18n"
%> <%@ page import="es.altia.agora.business.escritorio.UsuarioValueObject" %>
<%@ page import="es.altia.common.service.config.Config" %> <%@ page
import="es.altia.common.service.config.ConfigServiceHelper" %> <%@ page
import="es.altia.flexia.integracion.moduloexterno.melanbide11.util.ConfigurationParameter"
%> <%@ page
import="es.altia.flexia.integracion.moduloexterno.melanbide11.util.ConstantesMeLanbide11"
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <% int idiomaUsuario = 1; UsuarioValueObject usuarioVO = new
    UsuarioValueObject(); int idioma = 1; int apl = 5; String css = ""; if
    (session.getAttribute("usuario") != null) { usuarioVO = (UsuarioValueObject)
    session.getAttribute("usuario"); apl = usuarioVO.getAppCod(); idioma =
    usuarioVO.getIdioma(); idiomaUsuario = idioma; css = usuarioVO.getCss(); }
    MeLanbide11I18n I18N = MeLanbide11I18n.getInstance(); String numExpediente =
    (String)request.getAttribute("numExp"); String idProyecto =
    (String)request.getAttribute("idProyecto"); String urlPestanaResumen =
    (String)request.getAttribute("urlPestanaResumen"); if (urlPestanaResumen ==
    null || urlPestanaResumen.length() == 0) { urlPestanaResumen =
    "/jsp/extension/melanbide11/desglose/m11Desglose_Tab1.jsp"; } String
    urlPestanaComplementos =
    (String)request.getAttribute("urlPestanaComplementos"); if
    (urlPestanaComplementos == null || urlPestanaComplementos.length() == 0) {
    urlPestanaComplementos =
    "/jsp/extension/melanbide11/desglose/m11Desglose_Tab2.jsp"; } %>

    <link
      rel="StyleSheet"
      media="screen"
      type="text/css"
      href="<%=request.getContextPath()%><%=css%>"
    />
    <link
      rel="StyleSheet"
      media="screen"
      type="text/css"
      href="<%=request.getContextPath()%>/css/extension/melanbide11/melanbide11.css"
    />

    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/jquery/jquery-1.9.1.min.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/DataTables/datatables.min.js"
    ></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="<%=request.getContextPath()%>/scripts/DataTables/datatables.min.css"
    />
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/validaciones.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/popup.js"
    ></script>

    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/FixedColumnsTable.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/JavaScriptUtil.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/Parsers.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/InputMask.js"
    ></script>
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/lanbide.js"
    ></script>

    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/tabpane.js"
    ></script>

    <!-- Tabla nueva genrica (sin dependencias ECA) -->
    <script
      type="text/javascript"
      src="<%=request.getContextPath()%>/scripts/extension/melanbide11/TablaNueva.js"
    ></script>

    <title>
      <%= I18N.getMensaje(idiomaUsuario, "label.m11.desglose.titulo") %>
    </title>

    <script type="text/javascript">
      function ajustarVentanaDesglose() {
        try {
          var alto = document.body.scrollHeight + 20;
          var ancho = 790;
          if (window.resizeTo) {
            window.resizeTo(ancho, alto < 600 ? 600 : alto);
          }
        } catch (e) {}
      }
    </script>
  </head>

  <body
    class="bandaBody"
    onload="elementoVisible('off','barraProgresoLPEEL'); ajustarVentanaDesglose();"
  >
    <jsp:useBean
      id="descriptor"
      scope="request"
      class="es.altia.agora.interfaces.user.web.util.TraductorAplicacionBean"
    />
    <jsp:setProperty name="descriptor" property="idi_cod" value="<%=idioma%>" />
    <jsp:setProperty name="descriptor" property="apl_cod" value="<%=apl%>" />

    <div id="m11Container" style="width: 750px; margin: 10px auto 12px auto">
      <!-- Cabecera con estilo unificado -->
      <div class="legendAzul">
        <h1
          id="tituloPrincipalM11"
          style="
            margin: 0;
            text-align: center;
            font-size: 20px;
            line-height: 1.2;
          "
        >
          <%= I18N.getMensaje(idiomaUsuario, "label.m11.desglose.titulo") %>
        </h1>
        <div style="text-align: center; font-size: 13px; margin: 10px">
          <strong>Expediente:</strong> <%=
          (numExpediente!=null?numExpediente:"-") %>
        </div>
      </div>

      <div id="tab-panel-m11" class="tab-pane m11-tabs">
        <div class="tab-header-container">
          <h2 class="tab" data-tab="tabPageM11_1">
            <%= I18N.getMensaje(idiomaUsuario, "label.m11.desglose.titulo.tab1")
            %>
          </h2>
          <h2 class="tab" data-tab="tabPageM11_2">
            <%= I18N.getMensaje(idiomaUsuario, "label.m11.desglose.titulo.tab2")
            %>
          </h2>
        </div>
        
        <div class="tab-page" id="tabPageM11_1">
          <div class="tab-content-separator"></div>
          <jsp:include page="<%= urlPestanaResumen %>" flush="true" />
        </div>

        <div class="tab-page" id="tabPageM11_2">
          <div class="tab-content-separator"></div>
          <jsp:include page="<%= urlPestanaComplementos %>" flush="true" />
        </div>
      </div>

      <div
        class="botonera"
        style="text-align: center; margin: 20px 0 10px 0; padding-top: 10px"
      >
        <input
          type="button"
          id="btnAceptar"
          name="btnAceptar"
          class="botonGeneral"
          value="<%= I18N.getMensaje(idiomaUsuario, "btn.aceptar") %>"
          onclick="aceptarDesglose();"
        />
        <input
          type="button"
          id="btnCancelar"
          name="btnCancelar"
          class="botonGeneral"
          value="<%= I18N.getMensaje(idiomaUsuario, "btn.cancelar") %>"
          onclick="cancelarDesglose();"
        />
      </div>

      <script type="text/javascript">
        (function () {
          var cont = document.getElementById("tab-panel-m11");
          if (!cont) {
            return;
          }
          try {
            if (typeof WebFXTabPane !== "undefined") {
              var tpM11 = new WebFXTabPane(cont);
              try {
                tpM11.setSelectedIndex(0);
              } catch (e) {}
              return;
            }
          } catch (ign) {}

          try {
            var tabPages = cont.getElementsByClassName("tab-page");
            var headers = cont.querySelectorAll("h2.tab");
            function selectTab(idx) {
              for (var i = 0; i < tabPages.length; i++) {
                tabPages[i].style.display = i === idx ? "block" : "none";
                if (headers[i]) {
                  if (i === idx) headers[i].className = "tab selected";
                  else headers[i].className = "tab";
                }

                if (i === idx) {
                  if (tabPages[i].className.indexOf("selected") === -1) {
                    tabPages[i].className += " selected";
                  }
                } else {
                  tabPages[i].className = tabPages[i].className
                    .replace(/\bselected\b/g, "")
                    .trim();
                }
              }
            }
            for (var j = 0; j < headers.length; j++) {
              (function (ix) {
                headers[ix].onclick = function () {
                  selectTab(ix);
                };
              })(j);
            }
            // seleccionar primera pestaa por defecto
            selectTab(0);
          } catch (e) {
            /* sin pestaas */
          }
        })();
      </script>

      <script type="text/javascript">
        function aceptarDesglose() {
          console.log("=== ACEPTAR DESGLOSE ===");
          console.log(
            "window.guardarDesglose exists:",
            typeof window.guardarDesglose
          );
          if (typeof window.guardarDesglose === "function") {
            window.guardarDesglose();

            // Cerrar modal despu�s de guardar
            setTimeout(function () {
              try {
                // Intentar callback al padre
                if (window.opener && window.opener.modalCallback) {
                  window.opener.modalCallback([
                    "0",
                    "Desglose guardado exitosamente",
                  ]);
                } else if (window.parent && window.parent.modalCallback) {
                  window.parent.modalCallback([
                    "0",
                    "Desglose guardado exitosamente",
                  ]);
                }

                // Cerrar ventana/modal
                if (window.opener) {
                  window.close();
                } else if (window.parent && window.parent !== window.self) {
                  window.parent.window.close();
                } else {
                  window.close();
                }
              } catch (e) {
                console.warn("Error cerrando modal:", e);
                window.close();
              }
            }, 1500);
          } else {
            console.warn(
              "window.guardarDesglose no est disponible, cerrando ventana"
            );
            window.close();
          }
        }

        function volverDesglose() {
          var mensaje = "Seguro que quieres salir?";
          var confirmar = false;
          try {
            if (typeof jsp_alerta === "function") {
              confirmar = jsp_alerta("", mensaje) == 1;
            } else {
              confirmar = confirm(mensaje);
            }
          } catch (e) {
            confirmar = confirm(mensaje);
          }
          if (!confirmar) return;

          try {
            window.skipCancelConfirm = true;
          } catch (e) {}
          if (typeof window.cancelar === "function") {
            window.cancelar();
          } else {
            try {
              window.close();
            } catch (e) {}
          }

          setTimeout(function () {
            try {
              window.skipCancelConfirm = false;
            } catch (e) {}
          }, 1500);
        }

        function cancelarDesglose() {
          console.log("=== CANCELAR DESGLOSE ===");
          console.log("window.cancelar exists:", typeof window.cancelar);
          if (typeof window.cancelar === "function") {
            window.cancelar();
          } else {
            console.warn("window.cancelar no est disponible, cerrando ventana");
            if (confirm("Seguro que desea cancelar la operacin?")) {
              window.close();
            }
          }
        }

        function eliminarDesglose() {
          console.log("=== ELIMINAR DESGLOSE ===");

          var hayRegistroSeleccionado = false;
          var mensajeConfirmacion =
            "Est seguro de que desea eliminar este registro?";
          var detallesRegistro = "";

          try {
            var idRegistro = "";

            var inputId1 = document.getElementById("idRegistroContratacion");
            if (inputId1 && inputId1.value && inputId1.value.trim() !== "") {
              idRegistro = inputId1.value.trim();
              hayRegistroSeleccionado = true;
              detallesRegistro = " (ID: " + idRegistro + ")";
            }

            if (!hayRegistroSeleccionado) {
              var inputs = document.querySelectorAll(
                'input[id*="id"], input[name*="id"], input[id*="Id"], input[name*="Id"]'
              );
              for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value && inputs[i].value.trim() !== "") {
                  idRegistro = inputs[i].value.trim();
                  hayRegistroSeleccionado = true;
                  detallesRegistro = " (ID: " + idRegistro + ")";
                  break;
                }
              }
            }

            if (!hayRegistroSeleccionado) {
              var filasSeleccionadas = document.querySelectorAll(
                "tr.selected, tr.highlight, tr.rowSelected"
              );
              if (filasSeleccionadas && filasSeleccionadas.length > 0) {
                hayRegistroSeleccionado = true;
                detallesRegistro =
                  " (" +
                  filasSeleccionadas.length +
                  " registro(s) seleccionado(s))";
              }
            }
          } catch (e) {
            console.warn("Error verificando registro seleccionado:", e);
          }

          if (!hayRegistroSeleccionado) {
            if (typeof jsp_alerta === "function") {
              jsp_alerta("A", "Debe seleccionar un registro para eliminar.");
            } else {
              alert("Debe seleccionar un registro para eliminar.");
            }
            return;
          }

          mensajeConfirmacion =
            "Est seguro de que desea eliminar este registro" +
            detallesRegistro +
            "?\n\nEsta accin no se puede deshacer.";

          var confirmar = false;
          try {
            if (typeof jsp_alerta === "function") {
              var resultado = jsp_alerta("C", mensajeConfirmacion);
              confirmar = resultado == 1;
            } else {
              confirmar = confirm(mensajeConfirmacion);
            }
          } catch (e) {
            confirmar = confirm(
              "Est seguro de que desea eliminar este registro?"
            );
          }

          if (!confirmar) {
            console.log("Eliminacin cancelada por el usuario");
            return;
          }

          var tab1 = document.getElementById("tabPageM11_1");
          var tab2 = document.getElementById("tabPageM11_2");
          var tab1Active =
            tab1 && tab1.className && tab1.className.indexOf("selected") !== -1;
          var tab2Active =
            tab2 && tab2.className && tab2.className.indexOf("selected") !== -1;

          console.log(
            "Eliminando desde pestaa - Tab1 activa:",
            tab1Active,
            "Tab2 activa:",
            tab2Active
          );

          if (tab1Active && typeof window.m11_eliminarTab1 === "function") {
            console.log("Eliminando desde Tab1");
            return window.m11_eliminarTab1();
          }

          if (tab2Active && typeof window.m11_eliminarTab2 === "function") {
            console.log("Eliminando desde Tab2");
            return window.m11_eliminarTab2();
          }

          if (typeof window.m11_eliminar === "function") {
            console.log("Eliminando con m11_eliminar");
            return window.m11_eliminar();
          }

          if (typeof jsp_alerta === "function") {
            jsp_alerta(
              "A",
              "Funcin de eliminacin no disponible en esta pestaa."
            );
          } else {
            alert("Funcin de eliminacin no disponible en esta pestaa.");
          }
        }

        function habilitarBotonEliminar(habilitar) {
          var btnEliminar = document.getElementById("btnEliminarDesglose");
          if (btnEliminar) {
            btnEliminar.disabled = !habilitar;
            if (habilitar) {
              btnEliminar.title = "Eliminar registro seleccionado";
            } else {
              btnEliminar.title = "Seleccione un registro para eliminar";
            }
          }
        }

        window.aceptarDesglose = aceptarDesglose;
        window.cancelarDesglose = cancelarDesglose;
        window.eliminarDesglose = eliminarDesglose;
        window.habilitarBotonEliminar = habilitarBotonEliminar;
        window.volverDesglose = volverDesglose;
      </script>
    </div>
  </body>
</html>
