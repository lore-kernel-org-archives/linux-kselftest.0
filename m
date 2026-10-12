Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6305442FCD;
	Mon, 12 Oct 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795968; cv=none; b=UWx9mP+9vO4/lD0C8gO6ms5644U5aXCRI+H4AJ3A5TCvTYIxDkrvRom9K6pgObnCFU2KHmJKCtc2J2k3VUABFJ/yjdIO2b7ZRII2zT8vBM/+e/zP0JjZvc1c7nebkFg1Dhvf4TGdXgOfjClldnahQ9lpyBkzcs6M9htwflW2BUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795968; c=relaxed/simple;
	bh=2JYIR4kdmdUMpW51PqVrxKJvj21Ol+khAPDX++557VE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qiI7e7OlvMaPsFe5l14VyHZFfhsVuVP8RZavhVR4l/1wq0VDHnhntJ7emUmzXW2+qBOUTUmg30/LD/CStpZy/fzhYk5IrVf7mkyUUlq0GWq58dRT8ovgPtnvpggRArmki5SUD1wYn3PN/8Lc04SisqDfCCvWrNFG3NFybLupYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJQRhGIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJQRhGIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5CB1F0089B;
	Mon, 12 Oct 2026 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795967;
	bh=o4J0rAOC6ATNcAor2O0Ze/mrGGuRO7Iyonpg+eu5oHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TJQRhGIsDWeUhA0R1lrux7ZoHINqF+Nr7PQ+yAbz1l2Ncx+yc+SAOM/2T/9pUhT6c
	 DW2uYorp9ucnZB50HYeSNn8en21obusILVUqTJJe4EeEBNRJ0ziJQ9/Ylg5UQ/k733
	 ZQ8bb9Yf6G7SEhgy8F1pn7gE/haj11apMhluLFl6fLpZCUx08b9/GayjLifzivxrsz
	 BWlqy9e55gersKOylO0U2hfHtE7NJGSCQAq1DV9b8s/8t7W6W8bJH2osQDEvR4nyi5
	 qXk9y0GLzDwnqTeJ9BQYjDt6Y4fMMOahzOyyTbKW7zyr50xiFHwcGz7hIHdDaRp7re
	 GzCXq2TEsJglA==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20261007114914.1668934-1-sahaj123.sc@gmail.com>
References: <20261007114914.1668934-1-sahaj123.sc@gmail.com>
Subject: Re: [PATCH] selftests: pid_namespace: test fork with dead ancestor
Message-Id: <20261012-ausformuliert-einnimmt-filmhochschule-fe395369d5dc@brauner>
Date: Mon, 12 Oct 2026 11:06:04 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Wed, 07 Oct 2026 17:19:14 +0530, Sahaj Chaudhari wrote:
> Add a regression test for fork() into a PID namespace whose parent
> namespace has lost its init process. Since the kernel cannot assign the
> new process a PID in that dead ancestor, fork() must fail with ENOMEM.
> 
> Create the nested PID namespaces, keep the child namespace handle open
> after its init process exits, then enter it and verify fork() fails.
> 
> [...]

Applied to the kernel-7.4.signal branch of the vfs/vfs.git tree.
Patches in the kernel-7.4.signal branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-7.4.signal

[1/1] selftests: pid_namespace: test fork with dead ancestor
      https://git.kernel.org/vfs/vfs/c/2ec5a0709461

