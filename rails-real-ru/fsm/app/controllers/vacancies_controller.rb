# frozen_string_literal: true

class VacanciesController < ApplicationController
  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def publish
    update_state(:published)
  end

  def archive
    update_state(:archived)
  end
  # END

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end

  def update_state(state)
    vacancy = Vacancy.find(params[:id])
    if vacancy.archived?
      redirect_to vacancies_path, notice: 'Vacancy not on moderate.'
    else
      vacancy.update(aasm_state: state)
      redirect_to vacancies_path, notice: 'Vacancy was successfully updated.'
    end
  end
end
