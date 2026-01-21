-- =====================================================
-- MINI WORKSHOP DEMO
-- Ejecutado desde VS Code (Snowflake Extension)
-- =====================================================

USE DATABASE DEMO_WS;
USE SCHEMA WORKSHOP;

-- 1. Crear tabla demo
CREATE OR REPLACE TABLE DEMO_CLIENTES (
    ID_CLIENTE NUMBER,
    NOMBRE     STRING,
    FECHA_ALTA DATE
);

-- 2. Insert simple
INSERT INTO DEMO_CLIENTES VALUES
(1, 'Cliente A', CURRENT_DATE()),
(2, 'Cliente B', CURRENT_DATE());

-- 3. Consulta para validar
SELECT * FROM DEMO_CLIENTES;
