Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4F47DF99;
	Tue, 21 Jul 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629090; cv=none; b=GqKeCoIItdeA3K/pSMQeDb4j43tJ5/GjwBJXhMamiALQlb4GLYfRRFTkWuGKQ9qkHiLcFbJ7nuipAFaivAf9MsflXckzkMWxXNesnfT4eN64lOR5gL7kL3gh+DjkrTp11wIkZ18Wv5+vg2wQ/4Qmf2TgQczx6x8CRGPsdIp8Wug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629090; c=relaxed/simple;
	bh=xRlfCb46CB+gGxXwWo13E8lxz0S6Fs6ekogEzvmYKPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g+XNNLggEEmwhH0EZb+28wZ+w7SjjM119I4YrIgXVPxzVV3cZXEdRE60t2MYzwChUPHT65owCEqdJpHXt5TaWC8IufQvUcpFBddzd+XFiH6a5xB5z7xa8O1UDtYSfUhq9yLzOhGwywNS6ykBkcoaHz4PMw/SwKd3Gso+8XVHnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY/8CdIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY/8CdIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EBA1F00A3A;
	Tue, 21 Jul 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629088;
	bh=G9KptbPfnIgk2bUb5Qj1IQpjzcDG7GjvoAGyCyRjQo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oY/8CdIMianL5NblgYWpWiFUahwsegpJQhFwXg6BtToG1IzacIHXoqtYGefB0IRfI
	 49RD764ijYJMa7BUsqWpsuswZJOk1UxbEiyxLITx4l3MhOcBVeElMa6tzDM26/HA4J
	 5gtGcGEY1KHkHCbCKLLHLztDhsmdJLEXvJqL4HE6WEIaKVlesh3gg6HQznjOWWameg
	 D13kINwDITXDS28jEEAthAwYnAPxJFxEedBLUsCTN5lzapJSeXcEmqNbCV053UbGWT
	 3HRA7sQDvhDIagbU1OcbQeBIl9FgSI7xl4AWk/xqoWHIyEdm25vBu/a8j8NbquORDD
	 gUO8l1sU6Nztg==
From: Mike Rapoport <rppt@kernel.org>
To: pasha.tatashin@soleen.com, pratyush@kernel.org, 
 Vipin Sharma <vipinsh@google.com>
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
 dmatlack@google.com, linux-kernel@vger.kernel.org, 
 kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260720203202.1964557-1-vipinsh@google.com>
References: <20260720203202.1964557-1-vipinsh@google.com>
Subject: Re: [PATCH v4 0/2] Make liveupdate selftests library
Message-Id: <178462907906.500652.4199471528336671016.b4-ty@b4>
Date: Tue, 21 Jul 2026 13:17:59 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Mon, 20 Jul 2026 13:32:00 -0700, Vipin Sharma wrote:
> Make liveupdate selftests library
> 
> Hello,
> 
> This is v4 series of refactoring liveupdate selftests as a library. It
> exposes common liveupdate ioctls as a library which can be used by other
> selftests like VFIO and IOMMU.
> 
> [...]

Applied to selftests-lib branch of liveupdate/linux.git tree, thanks!

[1/2] selftests/liveupdate: Use luo_test_utils.c for liveupdate ioctl APIs
      commit: c5555d4777e3bb80b1b4b25bd678085e22a02d08
[2/2] selftests/liveupdate: Move luo_test_utils.* into a reusable library
      commit: a19aa15b814d0b824b4af8718568e69397fc2e95

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: selftests-lib

--
Sincerely yours,
Mike.


