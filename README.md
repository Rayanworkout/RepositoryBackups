
# Automated Repos Backups

A cool bash script to regularly create a local backup of your github repositories, in case you loose access to it.

Just add your github token, the repos you want to keep locally and you're good to go.

Full tutorial [on my website](https://rayan.sh/blog/5), quickstart below.
## Deployment

To deploy this project first clone the repo

```bash
  git clone https://github.com/Rayanworkout/RepositoryBackups.git
```

Rename `repositories.example.txt` to `repositories.txt`

```bash
  cd RepositoryBackups
  mv repositories.example.txt repositories.txt
```

Write into it the name of the repos you want to keep.

Now we just need to edit `backup_projects.sh`
Open it with the text editor of your choice.

1) Mention the path of your `repositories.txt`


It could be `./repositories.txt` but you'll need to mention the full path if you plan to use the script with `cron` or another job automation tool.


2) Github Username

You need to give the script your username. (Not the email address)
```bash
  USERNAME="YOUR_USERNAME"
```

3) Github Token (optionnal)

If you plan to backup private repositories, you'll need to mention your Github token. Password authentication is no longer allowed.

Create a token by following the instructions [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token).

```bash
  TOKEN="GITHUB_TOKEN"
```
Save your changes, it should be ok.

Finally, make sure the bash script is executable.

```bash
  chmod +x backup_projects.sh
```

You can now run the script, enjoy.
## License

[MIT](https://choosealicense.com/licenses/mit/)
