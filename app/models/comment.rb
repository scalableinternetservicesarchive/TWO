class Comment < ApplicationRecord
    belongs_to :WhateverChat, optional: true
end
