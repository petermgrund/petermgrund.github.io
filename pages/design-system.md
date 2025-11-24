---
layout: page
title: Design System
permalink: /design-system/
---

# Design System

A comprehensive design system for maintaining consistency across the website.

## Table of Contents

- [Colors](#colors)
- [Typography](#typography)
- [Spacing](#spacing)
- [Buttons](#buttons)
- [Cards](#cards)
- [Alerts](#alerts)
- [Status Indicators](#status-indicators)
- [Forms](#forms)
- [Navigation](#navigation)
- [Grid Layouts](#grid-layouts)

---

## Colors

### Primary Colors

<div class="grid-container grid-3" style="margin: 2rem 0;">
  <div style="background: #0b0c0c; padding: 2rem; color: white; border-radius: 4px;">
    <strong>Primary</strong><br>#0b0c0c
  </div>
  <div style="background: #fdd522; padding: 2rem; border-radius: 4px;">
    <strong>Highlight</strong><br>#fdd522
  </div>
  <div style="background: #936d95; padding: 2rem; color: white; border-radius: 4px;">
    <strong>Hover</strong><br>#936d95
  </div>
</div>

### Semantic Colors

<div class="grid-container grid-4" style="margin: 2rem 0;">
  <div style="background: #198754; padding: 2rem; color: white; border-radius: 4px;">
    <strong>Success</strong><br>#198754
  </div>
  <div style="background: #0dcaf0; padding: 2rem; border-radius: 4px;">
    <strong>Info</strong><br>#0dcaf0
  </div>
  <div style="background: #ffb020; padding: 2rem; border-radius: 4px;">
    <strong>Warning</strong><br>#ffb020
  </div>
  <div style="background: #dc3545; padding: 2rem; color: white; border-radius: 4px;">
    <strong>Danger</strong><br>#dc3545
  </div>
</div>

---

## Typography

### Headings

<div style="margin: 2rem 0;">
  <h1>Heading 1 (4.8rem / 48px)</h1>
  <h2>Heading 2 (3.6rem / 36px)</h2>
  <h3>Heading 3 (2.7rem / 27px)</h3>
  <h4>Heading 4 (2.1rem / 21px)</h4>
  <h5>Heading 5 (1.8rem / 18px)</h5>
  <h6>Heading 6 (1.6rem / 16px)</h6>
</div>

### Font Sizes

- **Extra Small**: 1.2rem (12px)
- **Small**: 1.4rem (14px)
- **Base**: 1.6rem (16px)
- **Medium**: 1.8rem (18px)
- **Large**: 2.4rem (24px)
- **Extra Large**: 3.2rem (32px)

### Body Text

<p>This is regular body text using Helvetica, Arial, sans-serif. The base font size is 1.6rem (16px) with a line height of 1.6 for optimal readability.</p>

<p class="text-small">This is small text (1.4rem / 14px)</p>
<p class="text-large">This is large text (2.4rem / 24px)</p>

---

## Spacing

The design system uses an 8px base spacing unit:

- **space-1**: 4px
- **space-2**: 8px
- **space-3**: 12px
- **space-4**: 16px
- **space-5**: 20px
- **space-6**: 24px
- **space-8**: 32px
- **space-10**: 40px
- **space-12**: 48px

---

## Buttons

### Button Variants

<div style="margin: 2rem 0; display: flex; gap: 1rem; flex-wrap: wrap;">
  {% include design-system/button.html text="Primary Button" variant="primary" %}
  {% include design-system/button.html text="Secondary Button" variant="secondary" %}
  {% include design-system/button.html text="Outline Button" variant="outline" %}
  {% include design-system/button.html text="Success Button" variant="success" %}
  {% include design-system/button.html text="Info Button" variant="info" %}
  {% include design-system/button.html text="Warning Button" variant="warning" %}
</div>

### Button Sizes

<div style="margin: 2rem 0; display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
  {% include design-system/button.html text="Small" variant="primary" size="sm" %}
  {% include design-system/button.html text="Medium (Default)" variant="primary" size="md" %}
  {% include design-system/button.html text="Large" variant="primary" size="lg" %}
</div>

### Usage

```liquid
{% raw %}{% include design-system/button.html
   text="Click Me"
   url="/path"
   variant="primary"
   size="md"
%}{% endraw %}
```

---

## Cards

### Card Variants

<div class="grid-container grid-3" style="margin: 2rem 0;">
  {% include design-system/card-component.html
     title="Default Card"
     content="This is a default card with standard styling."
     variant="default"
  %}

  {% include design-system/card-component.html
     title="Bordered Card"
     content="This card has a border and subtle shadow."
     variant="bordered"
  %}

  {% include design-system/card-component.html
     title="Shadow Card"
     content="This card has an elevated shadow effect."
     variant="shadow"
  %}
</div>

### Usage

```liquid
{% raw %}{% include design-system/card-component.html
   title="Card Title"
   subtitle="Card Subtitle"
   content="Card content here"
   variant="default"
%}{% endraw %}
```

---

## Alerts

### Alert Types

{% include design-system/alert.html
   type="info"
   content="This is an informational alert with important details."
%}

{% include design-system/alert.html
   type="success"
   content="Success! Your action was completed successfully."
%}

{% include design-system/alert.html
   type="warning"
   content="Warning: Please review this information carefully."
%}

{% include design-system/alert.html
   type="danger"
   content="Error: Something went wrong. Please try again."
%}

### Usage

```liquid
{% raw %}{% include design-system/alert.html
   type="info"
   content="This is an alert message"
%}{% endraw %}
```

---

## Status Indicators

### Status Badges

<div style="margin: 2rem 0; display: flex; gap: 1rem; flex-wrap: wrap;">
  {% include design-system/status-badge.html status="draft" %}
  {% include design-system/status-badge.html status="queue" %}
  {% include design-system/status-badge.html status="subcommittee" %}
  {% include design-system/status-badge.html status="revise" %}
  {% include design-system/status-badge.html status="approved" %}
  {% include design-system/status-badge.html status="completed" %}
  {% include design-system/status-badge.html status="in-progress" %}
</div>

### Usage

```liquid
{% raw %}{% include design-system/status-badge.html
   status="approved"
   text="Approved"
%}{% endraw %}
```

---

## Forms

### Form Elements

<form style="max-width: 600px; margin: 2rem 0;">
  <div class="form-group">
    <label class="form-label" for="text-input">Text Input</label>
    <input type="text" id="text-input" class="form-input" placeholder="Enter text">
    <span class="form-help-text">This is helper text for the input field.</span>
  </div>

  <div class="form-group">
    <label class="form-label" for="email-input">Email Input</label>
    <input type="email" id="email-input" class="form-input" placeholder="you@example.com">
  </div>

  <div class="form-group">
    <label class="form-label" for="select-input">Select Dropdown</label>
    <select id="select-input" class="form-select">
      <option>Option 1</option>
      <option>Option 2</option>
      <option>Option 3</option>
    </select>
  </div>

  <div class="form-group">
    <label class="form-label" for="textarea-input">Textarea</label>
    <textarea id="textarea-input" class="form-textarea" placeholder="Enter your message"></textarea>
  </div>

  <div class="form-check">
    <input type="checkbox" id="checkbox-1">
    <label for="checkbox-1">Checkbox Option</label>
  </div>

  <div class="form-check">
    <input type="radio" id="radio-1" name="radio-group">
    <label for="radio-1">Radio Option 1</label>
  </div>

  <div class="form-check">
    <input type="radio" id="radio-2" name="radio-group">
    <label for="radio-2">Radio Option 2</label>
  </div>
</form>

---

## Navigation

### Breadcrumbs

<ul class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/projects">Projects</a></li>
  <li class="breadcrumb-current">Current Page</li>
</ul>

---

## Grid Layouts

### 3-Column Grid

<div class="grid-container grid-3" style="margin: 2rem 0;">
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Column 1</div>
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Column 2</div>
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Column 3</div>
</div>

### Auto-Responsive Grid

<div class="grid-container grid-auto" style="margin: 2rem 0;">
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Item 1</div>
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Item 2</div>
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Item 3</div>
  <div style="background: #f8f9fa; padding: 2rem; border: 2px solid #dee2e6; border-radius: 4px;">Item 4</div>
</div>

---

## Design Tokens

### File Structure

```
_design-system/
├── tokens/
│   ├── _colors.scss          # Color variables
│   ├── _typography.scss      # Typography scale
│   ├── _spacing.scss         # Spacing scale
│   └── _layout.scss          # Layout tokens
├── components/
│   ├── _buttons.scss         # Button styles
│   ├── _cards.scss           # Card styles
│   ├── _alerts.scss          # Alert styles
│   ├── _status.scss          # Status indicators
│   ├── _navigation.scss      # Navigation styles
│   ├── _forms.scss           # Form styles
│   └── _typography.scss      # Typography styles
├── patterns/
│   ├── _grid.scss            # Grid layouts
│   ├── _layout.scss          # Layout patterns
│   └── _utilities.scss       # Utility classes
└── _index.scss               # Main import file
```

### Importing the Design System

To use the design system in your SCSS files:

```scss
@import "design-system/index";
```

---

## Utility Classes

### Spacing

- `mt-{size}`, `mb-{size}`, `ml-{size}`, `mr-{size}` - Margin utilities
- `p-{size}` - Padding utilities
- Sizes: 0, 1, 2, 3, 4, 6, 8

### Display

- `d-none`, `d-block`, `d-inline`, `d-inline-block`

### Flexbox

- `flex`, `flex-column`, `flex-row`
- `flex-center`, `flex-between`, `flex-start`, `flex-end`

### Text

- `text-small`, `text-large`
- `text-muted`, `text-secondary`
- `text-bold`, `text-center`, `text-right`

### Width & Height

- `w-100`, `w-75`, `w-50`, `w-25`
- `h-100`, `h-auto`

---

## Accessibility

The design system includes built-in accessibility features:

- **Focus States**: All interactive elements have clear focus indicators using the highlight color
- **Color Contrast**: All color combinations meet WCAG AA standards
- **Semantic HTML**: Components use proper semantic markup
- **Screen Reader Support**: Utility classes for screen reader-only content (`.sr-only`)
- **Keyboard Navigation**: Skip links and proper tab order

---

## Browser Support

This design system supports:

- Modern evergreen browsers (Chrome, Firefox, Safari, Edge)
- CSS Grid and Flexbox layouts
- CSS Custom Properties (CSS variables)

---

<div class="alert alert-info">
  <strong>Note:</strong> This design system is a living document. It will evolve as the website grows and new patterns emerge.
</div>
