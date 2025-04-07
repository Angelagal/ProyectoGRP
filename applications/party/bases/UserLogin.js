import { DataTypes } from "sequelize";
import sequelize from './database.js';

const UserLogin = sequelize.define(
    'UserLogin',
    {
        user_login_id: {
            type: DataTypes.STRING,
            primaryKey: true,
        },
        party_id: {
            type: DataTypes.STRING,
        },
        enabled: {
            type: DataTypes.CHAR,
        },
        disabled_date_time: {
            type: DataTypes.DATE,
        },
    },
    {
        tableName: 'user_login',
        freezeTableName: true,
        timestamps: false,
    }
);

export default UserLogin;