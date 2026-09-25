# Photo upload service

Use the [framework](../../FRAMEWORK.md) and the small scope in the [exercise index](../../EXERCISES.md).

## The prompt

A user uploads one photo, receives its identifier, and retrieves that photo later.
Explain database metadata and blob storage before the learner compares where each kind of data belongs.

## Initial constraints

- Use one application server and modest traffic. No capacity arithmetic is required for this first pass.
- Requests already contain a verified user ID. Only the owner can retrieve the photo.
- Accept JPEG or PNG files up to 10 MB. Treat these as exercise assumptions.
- Store the photo and enough metadata to locate it and check ownership later.
- Exclude albums, public sharing, thumbnails, search, and a CDN from this first pass.

## What to produce

1. Record the upload and retrieval paths in `attempt.md`.
2. Draw the component responsibilities in Excalidraw and save the sketch as `attempt.png`.
3. Explain two choices with tradeoffs and one client-visible failure.

The learner owns the attempt. Do not supply a complete reference design first.

## One complication

The file write succeeds, but the metadata write fails.
Ask the learner what the client should see and what should happen to the saved file.

## Deferred topics

Large uploads, multipart transfer, geographic distribution, image transformation, and advanced access controls can wait for later exercises.
Use one to three normal sessions; record open questions before the next problem.
