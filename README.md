# Trabajos de Industrias 4.0

Este repositorio contiene prácticas y proyectos orientados a conceptos de la Industria 4.0, combinando seguridad de infraestructura de redes mediante scripting y aplicaciones de visión artificial con modelos de aprendizaje profundo.

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Lenguajes:** Python, Bash (Shell Script)
* **Inteligencia Artificial:** Modelos de detección de objetos (YOLO / PyTorch)
* **Redes y Seguridad:** Administración de firewalls y enrutamiento en Linux
* **Entorno:** Linux CLI

## 📂 Contenido del Repositorio

* **`Detactor.py`**[cite: 19]: Script principal en Python diseñado para ejecutar tareas de detección de objetos mediante visión computacional.
* **`best.pt`**[cite: 19]: Archivo de pesos (weights) que contiene el modelo neuronal entrenado, utilizado directamente por el script de detección.
* **`firewall_basico.sh`**[cite: 19]: Script de automatización en Bash para establecer políticas de seguridad y reglas esenciales en un firewall de Linux.
* **`firewall_dos_interfaces.sh`**[cite: 19]: Script avanzado en Bash estructurado para configurar el filtrado y enrutamiento de tráfico en un equipo que administra dos interfaces de red distintas.
* **`python`**[cite: 19]: Archivo o directorio asociado a la configuración del entorno de ejecución de Python.

## 🚀 Cómo ejecutar los scripts

**Para aplicar las reglas del firewall (se requieren permisos de superusuario):**
```bash
sudo bash firewall_basico.sh
sudo bash firewall_dos_interfaces.sh
