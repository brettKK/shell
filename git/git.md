

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
	+ status
	
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
		+ git diff --staged 显示缓存区与本地仓库的不同(--cached)
	
	+ fetch
	
	+ merge
		+ git merge --abort
	+ pull (equals fetch + merge)

	+ branch
		+ git branch newbranch
		+ git branch -d newbranch
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
