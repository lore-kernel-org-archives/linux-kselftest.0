Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDD3DDAFA;
	Mon,  6 Jul 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343319; cv=none; b=XSYGykOxsClQ6vaswezK4B9DoYhJ3G4jOTpHcDSn5VyPHMZeWxcDhgeD/sz90DUROcIGGMRC8A/03cuaoDs/5drM/xH10ROHu0E1xOi1xObIBmrorNCzxEh7CSs7JhEmInSbVPcyx3fANM2vGTHHZFfIMgd9NLPVi1SfNs6Cf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343319; c=relaxed/simple;
	bh=SlKJLN1T5pkYzWt0YAbdK07kATeVJEVkq/MV607AacI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sT0PiyKN6Ct0agT2AnBFhIJ6jq2bA01ni4Gufm6z+nClwS9ggYo63JJr2gHDjy2bVM41eD8YlNjmvCN4+pymz7o1lZrSWCRGkI4gLv7o70Wq4zqjQhQvFztePBC6GlnLKGio6w/BEsKEO28BO3Z362+3DTa1q2XkJCf9aOd5d4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSjgvMEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSjgvMEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18001F000E9;
	Mon,  6 Jul 2026 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783343318;
	bh=YaP30yBufy1SZAg1xxZUTNJuQo3M/Wvqy3asaD6s6iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DSjgvMEURXbPOW0czfMwYJ969oAvH2bTyJ63544EXGFr45f7KZX0LF84peIUHgmFo
	 SkhSjbg0tM+h+h0zilgzyz31cTqENVqLM8mcIqq9xTaOGvzkQM3Q4pJTHI8zqYKdH9
	 GJPCu/waqfd+8COS4hBEcKdqzkqichIpTdmSo2sf5C/gSavNF5rV+ehFJpWcR6tV9O
	 4Y71GEtanVuBCWWLn4gRCw9a7yf6VZ5DVyiTHzFXNPZvFKAJoSZ6rO+ro/u2I1xFS5
	 lZkaIZp9HRH/b6U4GeM6Nd70CiGrrZC6Ij6VvfVvUnHrQkqc1s0TedyjmEHwF+IFKI
	 flMcHIBVc+Wdw==
From: Christian Brauner <brauner@kernel.org>
To: linux-kselftest@vger.kernel.org, 
 Malaya Kumar Rout <malayarout91@gmail.com>
Cc: mrout@redhat.com, skhan@linuxfoundation.org, me@brighamcampbell.com, 
 Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, 
 Bhavik Sachdev <b.sachdev1904@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260704120437.99851-1-malayarout91@gmail.com>
References: <20260704120437.99851-1-malayarout91@gmail.com>
Subject: Re: [PATCH] selftests/statmount: Fix file descriptor leak in
 setup_namespace
Message-Id: <20260706-rauszuholen-pfauenauge-lesezeichen-3804672e8537@brauner>
Date: Mon, 06 Jul 2026 15:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=brauner@kernel.org;
 h=from:subject:message-id; bh=SlKJLN1T5pkYzWt0YAbdK07kATeVJEVkq/MV607AacI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR5r7i86rtg/NTJmqH3k++mvNVrbizqPXTPZuddOd2Nz
 TFT9TcZdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExE/Tgjw81LrAvY/05Xu523
 M/qwldDuSX/PTzn93OHSV9acM5vv7UhjZLg4waRDQZpx6p5dmTEpByKNn6xY1H5iW/e3y2+cePd
 kHmUEAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On Sat, 04 Jul 2026 17:34:36 +0530, Malaya Kumar Rout wrote:
> selftests/statmount: Fix file descriptor leak in setup_namespace

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

[1/1] selftests/statmount: Fix file descriptor leak in setup_namespace
      https://git.kernel.org/vfs/vfs/c/38e48ee20792

