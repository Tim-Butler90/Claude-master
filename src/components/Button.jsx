import * as React from "react";
import { Slot } from "@radix-ui/react-slot";
import { cn } from "../lib/utils";

/**
 * Accessible button. Structure and behavior only: every visual value
 * (color, radius, spacing, type) comes from the `.btn` rules in
 * src/index.css, which read the DESIGN.md / getdesign.md theme variables.
 *
 * - variant: "primary" | "secondary" | "ghost" | "danger" | "unstyled"
 *   ("unstyled" keeps behavior and accessibility but applies no visual classes)
 * - size:    "sm" | "md" | "lg"
 * - asChild: render the child element (e.g. <a>) with button styling
 * - loading: sets aria-busy and blocks activation, keeps the label
 */
export const Button = React.forwardRef(function Button(
  {
    variant = "primary",
    size = "md",
    asChild = false,
    loading = false,
    disabled = false,
    type = "button",
    className,
    children,
    onClick,
    ...props
  },
  ref
) {
  const Comp = asChild ? Slot : "button";
  const inactive = disabled || loading;

  const handleClick = (event) => {
    if (inactive) {
      event.preventDefault();
      return;
    }
    onClick?.(event);
  };

  return (
    <Comp
      ref={ref}
      className={cn(variant !== "unstyled" && "btn", className)}
      data-variant={variant}
      data-size={size}
      // Native <button> gets `disabled`; a Slot-ed link can't, so use aria-disabled.
      {...(asChild ? {} : { type, disabled: inactive })}
      aria-disabled={inactive || undefined}
      aria-busy={loading || undefined}
      onClick={handleClick}
      {...props}
    >
      {children}
    </Comp>
  );
});
