Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085023D16F0;
	Wed, 27 May 2026 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883932; cv=none; b=Xnjo9+rfO8KAUVWt5qlriyavKelJMXt0GKXH7bAwQPrMBb36jyKGc2tkwcI3E/6J4myVmSVtyLDoVH364WuyI/RzuaDEOMrNQ0sIGPDzFizCzgeAieyGjYVqOyqC5l08rx7hxMKaKWOicJl9a9HzISet5cXmOxTrgC/jTCoeiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883932; c=relaxed/simple;
	bh=ys6vpOspnvTW9DLrSGu3rTMoU+ICTx1MDqrvw13WUPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgF2kQreSi6PhaylIAve2uymyk8kbLmYWpRp7jwf3WF0MLeEuH6hJIDNezknSmpwXUw747bLqF1QZnoUdE2pt8eoAKATBnWBaekDqZt3+c3yRxKguJ0gDUTSSZ1dcGgL7t2D1vOQPvhL5xnOpgnLpatRXV/G0uIen1TG16B50xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0H8dMv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0H8dMv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB3A1F00A3A;
	Wed, 27 May 2026 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883930;
	bh=tcdKYcdH24xOGGn2+Mqyiy1EEMwFhdnpWR8o1jVzG6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X0H8dMv6jA9gt39jBVbMzphIl7HsAJH/dwaNMJ+dXjMJLts/oW2js+DnHLko9NIKD
	 cKoBNyF7xzjPpDcWs9O8jmnjDRSFhmqx/sZBsJkTGXtDLTdXaMyl7um9SIvn5ryA2U
	 2Y5WTSJ/PKdo4E2E4JSuqU8taU5+XvNZSeE9RoRK1yXLin/9b+nx8m2jbm5sRr3BN+
	 1gUIgP+A2rcll/c8yFy2O7MaQni4YKAf8ICacTGbyw3fLGATY2mzjDXo35CgaqabMs
	 Ww6V5Tpy/TgD8l+dyzFc0EHUmk7Ih+mLd0EDQEobh3nop0kwD9Oj36dou2ROnfPhT9
	 JVlG+3BW1OQxQ==
From: Christian Brauner <brauner@kernel.org>
To: shuah@kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	areber@redhat.com,
	khorenko@virtuozzo.com,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH 0/2] selftests/clone3: fix cap_checkpoint_restore test
Date: Wed, 27 May 2026 14:12:05 +0200
Message-ID: <20260527-handwagen-getextet-tilgen-f7ccd2bd9b41@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
References: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=brauner@kernel.org; h=from:subject:message-id; bh=ys6vpOspnvTW9DLrSGu3rTMoU+ICTx1MDqrvw13WUPE=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSJ3Z/2WLiDg/GSiY+x3MNNJ9mblddNvSd6+GzZ7LLHX RcF9Jmvd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEyE4xvDX4HjnG8D++1d5XuV V15u8XmkoDlfyz9c542WaW7qlys79jL8dy9gXP+aVTPi2dSjCzt0G6dekJlQ3LL4/pJ9Py43zFh 0hxUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 19:35:48 +0300, Eva Kurchatova wrote:
> This patchset fixes misuse of libcap library interface, and existing
> compilation warnings due to unused variables.
> 
> Eva Kurchatova (1):
>   selftests/clone3: fix libcap interface usage
> 
> Konstantin Khorenko (1):
>   selftests/clone3: remove unused variables
> 
> [...]

Applied to the kernel-7.2.misc branch of the vfs/vfs.git tree.
Patches in the kernel-7.2.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-7.2.misc

[1/2] selftests/clone3: fix libcap interface usage
      https://git.kernel.org/vfs/vfs/c/00429def23a6
[2/2] selftests/clone3: remove unused variables
      https://git.kernel.org/vfs/vfs/c/f192084a9c6f
