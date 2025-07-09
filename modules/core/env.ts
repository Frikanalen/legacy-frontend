import * as z from "zod"

const PublicEnvSchema = z.object({
  NEXT_PUBLIC_DJANGO_URL: z.string(),
  NEXT_PUBLIC_UPLOAD_URL: z.string(),
})

export const env = PublicEnvSchema.parse({
  NEXT_PUBLIC_DJANGO_URL: process.env.NEXT_PUBLIC_DJANGO_URL,
  NEXT_PUBLIC_UPLOAD_URL: process.env.NEXT_PUBLIC_UPLOAD_URL,
})
