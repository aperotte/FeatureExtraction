# @file PackageMaintenance
#
# Copyright 2016 Observational Health Data Sciences and Informatics
#
# This file is part of FeatureExtraction
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Format and check code
OhdsiRTools::formatRFolder()
OhdsiRTools::checkUsagePackage("FeatureExtraction")
OhdsiRTools::updateCopyrightYearFolder()

# Create manual and vignettes
shell("rm extras/FeatureExtraction.pdf")
shell("R CMD Rd2pdf ./ --output=extras/FeatureExtraction.pdf")

rmarkdown::render("vignettes/CreatingCustomCovariateBuilders.Rmd",
                  output_file = "../inst/doc/CreatingCustomCovariateBuilders.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))

rmarkdown::render("vignettes/CreatingCovariatesUsingCohortAttributes.Rmd",
                  output_file = "../inst/doc/CreatingCovariatesUsingCohortAttributes.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))
