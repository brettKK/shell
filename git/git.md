### git tutorial

------
git 保存的是快照；svn保存的是文件的变化

-----------
三种状态

+ modified 》工作区

add

+ staged 》暂存区

commit

+ commited 》 本地仓库

远程仓库

-------

+ git 常用命令
	+ init
	+ clone
	+ remote
		+ github上同步一个fork
		+ git remote -v
		+ git remote add upstream xx.git
		+ git fetch upstream
		+ git checkout master and git merge upstream/master
	+ log 只记录commit操作
	+ reflog 所有分支的所有操作（git log历史会同步到远程仓库，reflog只存在本地）

	+ config
		+ git config --add user.name brett.gong
		+ git config --add user.email brett.gong@qq.com

	+ add
	+ commit
	+ push
		+ git push -u origin brach
	+ diff 显示工作区与暂存区的不同
		+ 可以打patch
		+ git diff --staged 显示缓存区与本地仓库的不同(--cached)
	+ format-patch
	+ fetch

	+ merge
		+ git merge --abort
		+ git merge branchname （将branchname分支合并到当前分支，主干发布，开支开发，会用到）
	+ pull (equals fetch + merge)

	+ branch
		+ git branch newbranch
		+ git branch -r
			+ display remote branch
		+ git branch -a
			+ display both local branch and remote branch
		+ git branch -m | -M oldbranch newbranch
			+ rename the oldbranch to new branch
		+ git branch -d | -D branchname
			+ delete local branch
		+ git branch -d -r branchname
		 	+ result: delete remote branch
		+ git branch -vv
			+ 查看本地分支与远程分支之间的对应关系


		+ 远程分支重命名
			+ 先删除远程分支
				+ git branch --delete origin remote-branch-name
			+ 重命名本地分支
				+ git branch -m oldbranch newbranch
			+ 重新提交一个远程分支
				+ git push origin newbranch

		+ git branch --set-upstream-to=origin/remote-branch-name
			+ 将当前分支设置为跟踪来自origin的远程分支remote-branch-name
		+ git branch --set-upstream-to=origin/remote-branch-name local-branch-name
			+ 指定local-branch-name去跟踪origin的远程分支
			+ 如果local-branch-name在本地未创建，fatal: branch 'local xxx branch' does not exist

	+ checkout
		+ git checkout -b newbranch
		+ git checkout existbranch
		+ git checkout -- hello.py
		+ git checkout 版本号 hello.py
		+ git checkout head~ hello.py
		+ git checkout head~3 hello.py

	+ rm
	+ stash
		+ git stash //保存当前草稿，以便切换分支

	+ reset
		+ 重置head到指定的状态
		+ git reset --mixed HEAD~
		+ git reset --hard HEAD~
		+ git reset --soft HEAD~
	+ revert
		+ 撤销已经存在的提交
		+ git revert 版本号 == git reset --hard 版本号（消除log历史，不是特别好的操作）

	+ cherry-pick
		+ 用于把某次提交的内容合并到当前分支
		+ git cherry-pick banbenhao
		+ git cherry-pick --continue

	+ rebase
		+ git merge master （有叉）// git rebase master(线性)
