class WhateverChat < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :votes
  attr_accessor :status
end
