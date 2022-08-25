list_category = [
  {
    name: "Develoment",
    slug: "developmemt"
  },
  {
    name: "Besiness",
    slug: "besiness"
  },
  {
    name: "Finance & Accounting",
    slug: "finance-accounting"
  },
  {
    name: "IT & Software",
    slug: "it-software"
  },
  {
    name: "Office Productivity",
    slug: "office-productivity"
  },
  {
    name: "Personal Development",
    slug: "personal-development"
  },
  {
    name: "Design",
    slug: "design"
  },
  {
    name: "Marketing",
    slug: "marketing"
  },
  {
    name: "Lifestyle",
    slug: "lifestyle"
  },
  {
    name: "Photography & Video",
    slug: "photography-video"
  },
  {
    name: "Health & Fitness",
    slug: "health-fitness"
  },
  {
    name: "Music",
    slug: "music"
  },
  {
    name: "Teaching & Academics",
    slug: "teaching-academics"
  }
]


list_category.each { |e| Category.create(e) }