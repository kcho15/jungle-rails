describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("should load product details after clicking on the product from the home page", () => {
    cy.get(".products")
      .should("be.visible")
      .find("article:first")
      .contains("Scented Blade")
      .click();
    cy.url().should("include", "/products/2");
  });
});