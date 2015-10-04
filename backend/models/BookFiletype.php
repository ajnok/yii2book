<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "book_filetype".
 *
 * @property integer $id
 * @property string $filename_original
 * @property string $filename_system
 * @property integer $book_id
 * @property integer $filetype_id
 *
 * @property Book $book
 * @property Filetype $filetype
 */
class BookFiletype extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'book_filetype';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['filename_original', 'filename_system', 'book_id', 'filetype_id'], 'required'],
            [['book_id', 'filetype_id'], 'integer'],
            [['filename_original', 'filename_system'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'filename_original' => Yii::t('app', 'Filename Original'),
            'filename_system' => Yii::t('app', 'Filename System'),
            'book_id' => Yii::t('app', 'Book ID'),
            'filetype_id' => Yii::t('app', 'Filetype ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'book_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFiletype()
    {
        return $this->hasOne(Filetype::className(), ['id' => 'filetype_id']);
    }
}
