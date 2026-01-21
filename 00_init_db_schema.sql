-- =====================================================
-- 00 - INIT DB & SCHEMA
-- =====================================================
-- ⚠️ Este script CREA infraestructura mínima
-- =====================================================

-- 1. Crear base de datos
CREATE DATABASE IF NOT EXISTS DEMO_WS
COMMENT = 'Base de datos demo para workshop Snowflake';

-- 2. Crear esquema
CREATE SCHEMA IF NOT EXISTS DEMO_WS.WORKSHOP
COMMENT = 'Esquema demo para workshop Snowflake';

-- 3. Set contexto
USE DATABASE DEMO_WS;
USE SCHEMA WORKSHOP;
