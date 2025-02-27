# Bulk File Upload
- Docker: No
- Arquitectura serverless: Yes
- Automatizacion pruebas al desplegar: Codepipeline
- CodePipeline con Infraestructura como Código: CloudFormation (YAML)
- Python: 3.12
- Node.js: 23.5.0
- serverless: 4.7.0

## Crear y activar venv
python3.12 -m venv venv 
source venv/bin/activate

## Instalar requirements.txt
pip install -r requirements.txt

## Ejecutar .sh:
chmod +x install_serverless.sh
./install_serverless.sh

## Ejecutar offline:
serverless offline

## Este comando obtiene la configuración general de un API Gateway específico en AWS
aws apigateway get-rest-api --rest-api-id "ID DEL APIGATEWAY"

## Comando para verificar configuracion actual de API Gateway
aws apigateway get-stage --rest-api-id "ID DEL APIGATEWAY" --stage-name dev
aws apigateway get-stage --rest-api-id n39fargsbi --stage-name dev

## Comando para testing
python3 -m pytest testing/test_create_batch.py -s

