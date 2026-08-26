# lucasew's F-Droid repo

Here are some apps that I can no longer find, so I keep their APKs in my backups.

Some are abandoned but still beat many lower-quality apps online today.

# Usage
See https://lucasew.github.io/fdroid-repo/fdroid/repo/ for instructions.

# Rebuild

Saturday 02:00 UTC, or **Actions → Rebuild → Run workflow**.

Create the repo secret `REVANCEDBOT_SIGNING` first:

```bash
revancedbot keys generate
# paste the blob into Settings → Secrets → Actions
```

The job writes `fdroid/repo` and `fdroid/metadata`, then commits. Pages serves the tree.

Only one rebuild runs at a time. A new trigger waits. A second pending trigger replaces the first. A running job is not cancelled.

The first successful run re-signs the F-Droid index with that key. Existing clients will need the new fingerprint.

# Reminder for my future self

- https://f-droid.org/pt_BR/docs/Setup_an_F-Droid_App_Repo/
