<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "book".
 *
 * @property integer $id
 * @property string $title_th
 * @property string $title_en
 * @property integer $edition
 * @property string $isbn
 * @property string $published_year
 * @property string $created_at
 * @property string $updated_at
 * @property integer $publisher_id
 *
 * @property Publisher $publisher
 * @property BookAuthor[] $bookAuthors
 * @property BookFiletype[] $bookFiletypes
 * @property TagBook[] $tagBooks
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'book';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['edition', 'publisher_id'], 'integer'],
            [['published_year', 'created_at', 'updated_at'], 'safe'],
            [['publisher_id'], 'required'],
            [['title_th', 'title_en'], 'string', 'max' => 100],
            [['isbn'], 'string', 'max' => 13],
            [['isbn'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title_th' => Yii::t('app', 'Title Th'),
            'title_en' => Yii::t('app', 'Title En'),
            'edition' => Yii::t('app', 'Edition'),
            'isbn' => Yii::t('app', 'Isbn'),
            'published_year' => Yii::t('app', 'Published Year'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'publisher_id' => Yii::t('app', 'Publisher ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPublisher()
    {
        return $this->hasOne(Publisher::className(), ['id' => 'publisher_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBookAuthors()
    {
        return $this->hasMany(BookAuthor::className(), ['book_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBookFiletypes()
    {
        return $this->hasMany(BookFiletype::className(), ['book_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagBooks()
    {
        return $this->hasMany(TagBook::className(), ['book_id' => 'id']);
    }
}
