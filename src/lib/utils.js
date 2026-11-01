import { clsx } from "clsx";
import { twMerge } from "tailwind-merge";

/** Merge class names, resolving Tailwind conflicts (last wins). */
export function cn(...inputs) {
  return twMerge(clsx(inputs));
}
