require 'spec_helper'

describe Post do

  before { @post = Post.new(title: "Example post")}

  subject {@post}

  it{ should respond_to (:title)}


end
