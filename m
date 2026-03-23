Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B23B0AE2;
	Mon, 23 Mar 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279687; cv=none; b=q/mJxK2Lm0XhNGSv+OK8dg2D1EqMHY9NaVXa5Pzq+k8105LJ7JWq5Xjff6PRLaUOurBEx/i6rzoYL7DTnoBG0m64kzbCOr6D6U+XK+gFZaO41lG7js5qcQj0BCp4ZHyoBiLx/WpqmPRK4Nz49IIZc2ziFucY99W2OSg7ejgLPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279687; c=relaxed/simple;
	bh=0inbW287jRPXssblfcXdWvIf+BmJcrXcK4SdIvnEjnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1Dn2/dIrMkRTYEYbgYPUC87whv3npoDa3HRVIuNnCHU9J7GUZxgXgIDf4M3ZzHGaXsbCdnXzE2T+aMhdn10UkCi5vUR8994kzWXceTSfnpwToBfNSLHFTfNegKHMGbIFywtrb9M+rOI+BToF2YLi0xfiIeNWaTBDqcdJfJZWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wa8en8ye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wa8en8ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3156FC4CEF7;
	Mon, 23 Mar 2026 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774279687;
	bh=0inbW287jRPXssblfcXdWvIf+BmJcrXcK4SdIvnEjnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wa8en8yeBm23obTEKj3Q+7IOIBEUSObj8rxBwTrHNrmGMBwjlwnDS2vp8r6iMax5S
	 y0Ddhq8XMNN3LciqynxtbcoFtI+OBsOxm0x5olSdgJz6/nPR486AtgdiEP9ezmTITe
	 pAZ8kqQuEzzr9ZZdjGhPHGme3KCIZI+5QgLMh4q2K/OzprctNYeBPNe6SlT5N9+KSw
	 +cuyD6xgnaIx046r2vcwvm1S80SpKQq9sY7x/wbSyNVF0gcbFqVDdof6K5yP/gtM4i
	 rbOUZ75sL8eTrAOjfRCi8+mBR308nxiim1BZw+fuPnMcfPDDbyTEy23S/ceNUnVon9
	 bhABx0Vc2U0jA==
From: Christian Brauner <brauner@kernel.org>
To: linux-kernel@vger.kernel.org,
	Emanuele Rocca <emanuele.rocca@arm.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Clint George <clintbgeorge@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] kselftest/coredump: reintroduce null pointer dereference
Date: Mon, 23 Mar 2026 16:27:58 +0100
Message-ID: <20260323-idolisieren-bereuen-17430ffe5208@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ab2kI0PI_Vk6bU88@NH27D9T0LF>
References: <ab2kI0PI_Vk6bU88@NH27D9T0LF>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=brauner@kernel.org; h=from:subject:message-id; bh=0inbW287jRPXssblfcXdWvIf+BmJcrXcK4SdIvnEjnI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQejGGabG3c6RdbN1kyM33hCb6lwdY2vtNeLrvwrT3b+ /W5B19vdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzk0B9Ghocdfvz7DkZ3s4gH cyzfmna3s73r5o7qBYtaV35Lt3PsqGf4p9MXk615l8lT1rr1fDF/f6bErq6Q+e+KOyRP+G8JjMx nAgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 20 Mar 2026 20:46:43 +0100, Emanuele Rocca wrote:
> Commit 673a55cc49da replaced the null pointer dereference used in
> crashing_child() with __builtin_trap to address the following LLVM warnings:
> 
>  coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
>  coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
> 
> All coredump tests expect crashing_child() to result in a SIGSEGV. However, the
> behavior of __builtin_trap is architecture-dependent. On x86 it yields SIGILL,
> on aarch64 SIGTRAP. Given that neither of those signals are SIGSEGV, both
> coredump_socket_test and coredump_socket_protocol_test are currently failing:
> 
> [...]

Applied to the vfs-7.1.pidfs branch of the vfs/vfs.git tree.
Patches in the vfs-7.1.pidfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.1.pidfs

[1/1] kselftest/coredump: reintroduce null pointer dereference
      https://git.kernel.org/vfs/vfs/c/3fc66a103395
