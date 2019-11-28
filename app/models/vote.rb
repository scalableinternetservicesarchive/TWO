class Vote < ApplicationRecord
  belongs_to :WhateverChat, optional: true
end
