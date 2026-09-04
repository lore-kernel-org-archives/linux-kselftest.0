Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC63612E2;
	Fri,  4 Sep 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508205; cv=none; b=MpvkptopuKhylELXXZTDGYSwqtvaw1wvEMo+8ohTrDqByIa8eBpaUDgkaYIUqG1ClSGReuww/H+kjgI05uncmXWTbJ6D1g4y0IS//x1eo17jq5wJK4EBM+vTP7aGgR5FJPUbuv9S+LOASHS9OTDEI0JQ2uqzorwSwLCNBIthVP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508205; c=relaxed/simple;
	bh=tqbrAg4zqpX48Q5gno0yaHbZ+w6oCsX4KLmBKDPb7uE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=APOBAFaJKa5AssZImVVEyHn6IPU4KReGhLf0ixC8fAtA8ZcJS+UYJ0oQO9uvSGpVyhUIMuaJp15xD8Kqx3/jkNKqZUyEUkQVQzv/ExGEpBlqmn4JrXgUfRJe7IZdRp2EhKhOq55ThZ8GUECQz87Qve0JhJwlmKvUuOBeEyFzQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSJ5rnsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSJ5rnsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC051F00A3D;
	Fri,  4 Sep 2026 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508204;
	bh=mPL6YvgHR1/+2ZXwCt3JuYunyi1EKpt0iSdtdQW+WeU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PSJ5rnsS3k3E6efimeM95BzHzIoYJcaEpnYkx/Zw8HQF9yQ7AuaHzwspSoTDDHf0x
	 7ezAbTFHRoz2fO+rYRT9qDlhRqGpxr2AgtSZcxCbH3g+V+mCYi/k8ul8HsW+58+Q8s
	 E3gnZOxSFNH4b2tgrGm+l/dO9N/2T/ZDtISD0dVAAXDqei8znNAdar3vCxe+nl2ly8
	 nWcTGqD1uVh9wNz/d/HVGhbqosIpNzKnbAdmEONizLdEVjLnNfIDz8jiBS/XE1UN3E
	 w8sZlx6h1hpOHXygPxiWVKlXpQ9pWqzZQOEJC1RQd8NNASwJWlayCU770O+BuRD2fJ
	 lIge3zJ3Nbkiw==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Paul Dolan <paul.dolan.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260902174939.15135-1-paul.dolan.dev@gmail.com>
References: <20260902174939.15135-1-paul.dolan.dev@gmail.com>
Subject: Re: [PATCH] selftests/clone3: tighten CLONE_CLEAR_SIGHAND conflict
 test
Message-Id: <20260904-zinssatz-auftrag-kastanie-5a7b91104538@brauner>
Date: Fri, 04 Sep 2026 09:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-db0b7

On Wed, 02 Sep 2026 18:49:39 +0100, Paul Dolan wrote:
> The CLONE_CLEAR_SIGHAND test intends to verify that
> CLONE_CLEAR_SIGHAND and CLONE_SIGHAND are mutually exclusive. However,
> CLONE_SIGHAND without CLONE_VM is independently invalid, so the test
> input has another reason to fail with EINVAL.
> 
> Add CLONE_VM so that CLONE_SIGHAND is otherwise valid, and require
> clone3() to fail with EINVAL. This ensures the test exercises the
> intended flag conflict and does not accept an unrelated failure.
> 
> [...]

Applied to the vfs-7.4.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.4.misc

[1/1] selftests/clone3: tighten CLONE_CLEAR_SIGHAND conflict test
      https://git.kernel.org/vfs/vfs/c/aeebb4884f0e

