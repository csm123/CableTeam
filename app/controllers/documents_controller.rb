class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    @document.update!(document_params)
    redirect_to document_path(@document)
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end
end
