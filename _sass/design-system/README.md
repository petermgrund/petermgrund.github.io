# Design System

A comprehensive design system for maintaining consistency across the website.

## Overview

This design system provides a structured approach to styling and component development. It includes:

- **Design Tokens**: Foundational variables for colors, typography, spacing, and layout
- **Components**: Reusable UI components with consistent styling
- **Patterns**: Layout patterns and utility classes
- **Jekyll Includes**: Reusable component templates for easy integration

## File Structure

```
_design-system/
├── tokens/              # Design tokens (variables)
│   ├── _colors.scss         # Color palette and semantic colors
│   ├── _typography.scss     # Font scales, weights, line heights
│   ├── _spacing.scss        # Spacing scale and padding/margin values
│   └── _layout.scss         # Breakpoints, borders, shadows, transitions
│
├── components/          # UI components
│   ├── _typography.scss     # Typography component styles
│   ├── _buttons.scss        # Button styles and variants
│   ├── _cards.scss          # Card containers
│   ├── _alerts.scss         # Alert/info boxes
│   ├── _status.scss         # Status indicators
│   ├── _navigation.scss     # Navigation components
│   └── _forms.scss          # Form inputs and controls
│
├── patterns/            # Layout patterns and utilities
│   ├── _grid.scss           # Grid layout systems
│   ├── _layout.scss         # Container and layout utilities
│   └── _utilities.scss      # General utility classes
│
├── _index.scss          # Main import file
└── README.md            # This file
```

## Usage

### In SCSS Files

Import the entire design system:

```scss
@import "design-system/index";
```

Or import specific modules:

```scss
@import "design-system/tokens/colors";
@import "design-system/components/buttons";
```

### In Jekyll Templates

Use the reusable component includes located in `_includes/design-system/`:

#### Button Component

```liquid
{% include design-system/button.html
   text="Click Me"
   url="/path"
   variant="primary"
   size="md"
%}
```

**Parameters:**
- `text` (required): Button text
- `url` (optional): Link URL
- `variant` (optional): primary, secondary, outline, success, info, warning
- `size` (optional): sm, md, lg
- `block` (optional): true/false
- `type` (optional): button, submit, reset

#### Alert Component

```liquid
{% include design-system/alert.html
   type="info"
   content="This is an alert message"
%}
```

**Parameters:**
- `type` (required): info, success, warning, danger
- `content` (required): Alert message or HTML content
- `dismissible` (optional): true/false

#### Status Badge Component

```liquid
{% include design-system/status-badge.html
   status="approved"
   text="Approved"
%}
```

**Parameters:**
- `status` (required): draft, queue, subcommittee, revise, approved, completed, in-progress
- `text` (optional): Custom text

#### Card Component

```liquid
{% include design-system/card-component.html
   title="Card Title"
   subtitle="Card Subtitle"
   content="Card content here"
   image="/path/to/image.jpg"
   variant="default"
%}
```

**Parameters:**
- `title` (optional): Card title
- `subtitle` (optional): Card subtitle
- `content` (optional): Card body content
- `image` (optional): Image URL
- `footer` (optional): Card footer content
- `variant` (optional): default, bordered, shadow, flat
- `url` (optional): Makes entire card clickable

## Design Tokens

### Colors

```scss
// Primary Colors
$color-primary: #0b0c0c;
$color-highlight: #fdd522;
$color-hover: #936d95;

// Semantic Colors
$color-success: #198754;
$color-info: #0dcaf0;
$color-warning: #ffb020;
$color-danger: #dc3545;
```

### Typography

```scss
// Font Sizes
$font-size-xs: 1.2rem;   // 12px
$font-size-sm: 1.4rem;   // 14px
$font-size-base: 1.6rem; // 16px
$font-size-lg: 2.4rem;   // 24px
$font-size-xl: 3.2rem;   // 32px

// Font Weights
$font-weight-normal: 400;
$font-weight-semibold: 600;
$font-weight-bold: 700;
```

### Spacing

Based on an 8px unit:

```scss
$space-1: 4px;
$space-2: 8px;
$space-3: 12px;
$space-4: 16px;
$space-6: 24px;
$space-8: 32px;
```

## Components

### Buttons

Use `.btn` class with variants:

```html
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-outline">Outline</button>
```

Sizes:
```html
<button class="btn btn-primary btn-sm">Small</button>
<button class="btn btn-primary">Medium (Default)</button>
<button class="btn btn-primary btn-lg">Large</button>
```

### Cards

```html
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Title</h3>
  </div>
  <div class="card-body">
    <p class="card-text">Content</p>
  </div>
</div>
```

Variants: `.card-bordered`, `.card-shadow`, `.card-flat`

### Alerts

```html
<div class="alert alert-info">
  <p>This is an informational message.</p>
</div>
```

Types: `.alert-info`, `.alert-success`, `.alert-warning`, `.alert-danger`

### Status Indicators

```html
<span class="status-indicator status-approved">Approved</span>
```

Status types: `status-draft`, `status-queue`, `status-subcommittee`, `status-revise`, `status-approved`, `status-completed`, `status-in-progress`

### Forms

```html
<div class="form-group">
  <label class="form-label" for="input">Label</label>
  <input type="text" id="input" class="form-input" placeholder="Enter text">
  <span class="form-help-text">Helper text</span>
</div>
```

## Patterns

### Grid Layouts

```html
<!-- 3-column grid -->
<div class="grid-container grid-3">
  <div>Column 1</div>
  <div>Column 2</div>
  <div>Column 3</div>
</div>

<!-- Auto-responsive grid -->
<div class="grid-container grid-auto">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

### Layout Utilities

```html
<div class="container">
  <div class="flex flex-between">
    <div>Left content</div>
    <div>Right content</div>
  </div>
</div>
```

### Spacing Utilities

```html
<div class="mt-4 mb-6">Margin top 16px, bottom 24px</div>
<div class="p-4">Padding 16px all sides</div>
```

## Utility Classes

### Display
- `.d-none`, `.d-block`, `.d-inline`, `.d-inline-block`

### Flexbox
- `.flex`, `.flex-column`, `.flex-row`
- `.flex-center`, `.flex-between`, `.flex-start`, `.flex-end`

### Text
- `.text-small`, `.text-large`
- `.text-muted`, `.text-secondary`
- `.text-bold`, `.text-center`, `.text-right`

### Spacing
- `.mt-{0,1,2,3,4,6,8}` - Margin top
- `.mb-{0,1,2,3,4,6,8}` - Margin bottom
- `.p-{0,2,3,4,6}` - Padding

### Borders & Shadows
- `.rounded`, `.rounded-sm`, `.rounded-lg`, `.rounded-full`
- `.shadow-sm`, `.shadow`, `.shadow-md`, `.shadow-lg`

## Accessibility

The design system includes built-in accessibility features:

- **Focus States**: All interactive elements have clear focus indicators
- **Color Contrast**: All color combinations meet WCAG AA standards
- **Semantic HTML**: Components use proper semantic markup
- **Screen Reader Support**: `.sr-only` utility class for screen reader-only content
- **Keyboard Navigation**: Skip links and proper tab order

## Browser Support

- Modern evergreen browsers (Chrome, Firefox, Safari, Edge)
- CSS Grid and Flexbox layouts
- CSS Custom Properties (CSS variables)

## Living Style Guide

View the complete style guide with examples at `/design-system/`

## Contributing

When adding new components or patterns:

1. Follow the existing naming conventions
2. Use design tokens instead of hard-coded values
3. Ensure accessibility standards are met
4. Document usage examples
5. Update the style guide page

## Questions?

For questions or suggestions, please open an issue or contact the maintainer.
