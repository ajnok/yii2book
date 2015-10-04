<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "filetype".
 *
 * @property integer $id
 * @property string $extension
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property BookFiletype[] $bookFiletypes
 */
class Filetype extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'filetype';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['extension'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['extension'], 'string', 'max' => 10],
            [['description'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'extension' => Yii::t('app', 'Extension'),
            'description' => Yii::t('app', 'Description'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBookFiletypes()
    {
        return $this->hasMany(BookFiletype::className(), ['filetype_id' => 'id']);
    }
}
