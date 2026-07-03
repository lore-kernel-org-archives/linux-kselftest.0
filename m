Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AB32E729;
	Fri,  3 Jul 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084225; cv=none; b=Rh/SKVhvC09xP35SEzNHN6ypbrWEerZwBXiueI1wRx6ChcEDv4lphMQpSiGenFacYosnJ5J5EG57zJGiqYC29T8JDdw13y4gSVWhf52rxOaU9u18OWbXIRduiuED1RmWV7O6hAlsEaH9dpVf0RdXP85iKcuLbzDJTNhc7BwtTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084225; c=relaxed/simple;
	bh=nkmbqZwsa2A4r6wri3s77e7fawYHNRU47QOLOIIqO6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aq2CwuFjsOm2RGx8WsEJ6ivF5i6w5+EYET2jB/jmKcb+mPIsyvyUxv1lEY6XM8AmCKwdcWA8ySOvquRT9XhaHeoVM57wVJNMxJxTwgTL0VutG9d1EocA2vIEOwt6lAwDWkz/37/Yzu+uXy+HiIXTG5pC4a6Vlp6Co/Nf0LVCmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+BgE0co; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+BgE0co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F283E1F000E9;
	Fri,  3 Jul 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084223;
	bh=ShijZS5NzpHwGkErhaAI2nPl/5W0vTRDU9IkKiqugJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i+BgE0coDgGDLvrWIrrZ25GrlC2zncgqzbu7dZ0lOPIHkorAWQlnyNbiNLbC45YAL
	 WA3DX2Ch3RONLIFxNve3e0s7YcPjJSSmw9l0LcOkuR2fzZC+ArZpC/Ic/gfKiDQUlr
	 QeY/QRqPh+OvSiFXftFZKdqXsZMUyXbE4Tm1gne+gGd0J5MqPVMHv23Nc8ku8NFe2u
	 TLa4Uu1ebU/iIc25yPYTbSwMaJ9uu5MoNuWjRmdmHjTffJAvsRi07/+c4yRioexXoA
	 hJCtYYNnzeaTIljzCw7Vc7KQeYaKbfQ038QP9cnXXiLcjig7So+cmhJghVo/NOMiXB
	 Gawcvs7zEBOCQ==
From: Christian Brauner <brauner@kernel.org>
To: shuah@kernel.org, Wang Yan <wangyan01@kylinos.cn>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702015428.363642-1-wangyan01@kylinos.cn>
References: <20260702015428.363642-1-wangyan01@kylinos.cn>
Subject: Re: [PATCH v2] selftests/filesystems: fix spelling error in
 statmount test comment
Message-Id: <20260703-abfertigung-weggehen-schutt-b5a51740ba20@brauner>
Date: Fri, 03 Jul 2026 15:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nkmbqZwsa2A4r6wri3s77e7fawYHNRU47QOLOIIqO6c=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5b9nHesRy9yLnbzkhH/rZ9BfPDPwk5ZbEvUd5xTYrR
 1HJBx5OHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOxF2Bk2B8s57DoR9Je98bi
 vtl/nzBWtU9psZl6wX/J6oJmA51iVYZ/+v1691IbXkRVXKnMP7wgcTuzVDGvRPjl+XfnHauvtn3
 JAwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On Thu, 02 Jul 2026 09:54:28 +0800, Wang Yan wrote:
> selftests/filesystems: fix spelling error in statmount test comment

Applied to the vfs-7.3.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.3.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.3.misc

[1/1] selftests/filesystems: fix spelling error in statmount test comment
      https://git.kernel.org/vfs/vfs/c/9e31e3fcce62

