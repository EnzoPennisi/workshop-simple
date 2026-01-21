-- =====================================================
-- 00 - INIT DB & SCHEMA
-- MINI WORKSHOP SNOWFLAKE
-- =====================================================
-- ⚠️ Este script CREA infraestructura mínima
-- ⚠️ NO se elimina en el cleanup
-- =====================================================

-- 1. Crear base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS DEMO_WS
    COMMENT = 'Base de datos demo para workshop Snowflake';

-- 2. Crear esquema (si no existe)
CREATE SCHEMA IF NOT EXISTS DEMO_WS.WORKSHOP
    COMMENT = 'Esquema demo para workshop Snowflake';

-- 3. Set contexto
USE DATABASE DEMO_WS;
USE SCHEMA WORKSHOP;
