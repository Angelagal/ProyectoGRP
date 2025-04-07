import { DataTypes } from "sequelize";
import sequelize from './database.js';

const Party = sequelize.define(
    'Party',
    {
        party_id: {
            type: DataTypes.STRING,
            primaryKey: true,
        },
        employee_num: {
            type: DataTypes.STRING,
        },
        puesto: { // Nuevo campo agregado
            type: DataTypes.STRING,
        }
    },
    {
        tableName: 'party',
        freezeTableName: true,
        timestamps: false,
    }
);

export default Party;
