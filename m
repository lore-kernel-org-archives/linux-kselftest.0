Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F41DCB24
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 03:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404810; cv=none; b=e0NfDZgxbgwvuXJer+FbYp7/poibdetAMq622ybYQS7iCLnVRea7qJZ1OgOd/K4HMsS1Upd6oPuAuPq4rx4fLPd3G+Yg3n+FNUmRGpw7f8EnrylxN0KR+Pk5vqwQuUzl/UiWcyipI2vVJ7v5nSYbw9x2YhXRx5TwF9Ggmn7nN+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404810; c=relaxed/simple;
	bh=w1n+78oRxsXjZry3gpcMWGqXK1ZsA1r47ox3rDyd00s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTYHex9/R9574c9Awcvrj3W7i4o/U5Qi5aNhjXbxViftCDLHmSf3J19CcwyduHtYNMp6A98zVQQsE868+m6jDFsYOiO5KK9sQBMq4toAIaWebn0CoOQpTPZWwpoR6qcX6LfqmxqzjGHPAtAL6bZMpvrez9zxobn/2s4Y4gg6s7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFjb4+Rh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFjb4+Rh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5cad1a6baso17358845ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 20:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404808; x=1789009608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA6TfANf9Ze+7t1hoZyjavPl8IZuFIwVPXJVLouCJ0o=;
        b=dFjb4+RhK3Yld3pdK7v0KgjYVi575C2E8r7CjnG/NVf9u1YJluCT6YOv82EjezdHhz
         4nw2TPOEGLNuNE/tz5o/eVYmI7PVZYb3v3H1HNCNb8Ktdb+wf3iYPGHzdt1ADD7tzV/n
         iC0o/6m5+uxoF4bT+rnQkFjYjEOhOiqD8Y0HH5KtWxZH5F1IrFQHmdDgKV1hg6VtBEOo
         sL5xd/hoU3KBD+rmHY9KJPjzoTQ5tctCGj2UD9TifYC7dMxFuel0IRpkzX3YNH1HEEU8
         K6ek6c/FL6iJoYkBDZ5EAYLMTPAC+iGH5c/tCBLFOSFp7QQyBtwT0NyO4SpCN5fFpXsQ
         sJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404808; x=1789009608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA6TfANf9Ze+7t1hoZyjavPl8IZuFIwVPXJVLouCJ0o=;
        b=CCRpzC4O0piYiyBxDYBo7WqSaqXakXirlgagBCFd112LtF3C9noVsDDU8OcNGRhesg
         WVnjwb0nPOUy/AA1g5xyXB7HUPdUcKY/mgK/SLdhFa64xwJi5A4JxNECgPODAFE/0xrt
         T6hU22TbvGOIS2vaVGoj2m+s3DD1tcbsqPqdVxQMYItn+QQUiIXtc2mzAx2xmZRKLFfi
         DSNNn7gntHq2LN4TrG5Gxz1QEAAQ9fnE72wemxYANLzlmLARES7TREXLfVAIhCkJaM0c
         6kmVkfRTPVatTf8mSziaHbEWdZ70jTDlPv9O1aPymUxPGM+VuVNSxkehZ/plY+0q+zIZ
         4wOQ==
X-Forwarded-Encrypted: i=1; AKwUvByaC2lHz9tDsRRev4ofs0KfXtO7XL4Ciznig0G07olTo7XmngjMA2dK9ZtBsu5Ng1pnaCBEhiRMqgCWF+/Dl44=@vger.kernel.org
X-Gm-Message-State: AFuF++kden1cAOO6r3tMKFmd8UWRA6SAaK+NUcsRAElCuHECA0dER55A
	P/lDdb2ixq2qXl+KWccCdZLctpjt/XCiZr1MLH+P8gMP2AlTxw/LHnGG
X-Gm-Gg: AYBFou3xiza8OiCMyx2+1fwlG1IfBlKyvxZt5J4gP2+FjPexHDpXiSKc1SJf5Fq9U4u
	UZYT8zV8gb4442zD94X6w6LmQThgeaTm85vxkgqUTnz9whVTFZvZA1mEXH1pPd7dCeqaEVd1ivJ
	XcJeGv5LPfC4b5sXTGUgbVKTfTSaVHaZz2u79cZipo2WgelvCpkNJf4KCDkeNxtR1v9t/m0t7XB
	/ONK4DiQZ/aURDzgodMaJYq1rU93JuNAjjHsERrlj79AUwd0o7mXvF/a2wW9pTOzp6gOYLcMjuE
	PY3mpWB4y7iWJI6GxbUbH5kBqFXEgWTV8d+Z2QdpuK9ScfoHpd92S8I3FuqGifis5tGvtLr02hf
	k8ikjucWlZVY9GHAF3JXjJW3F8q37S6zXLSoaEqP8GQg3P12YXMk/U5dZBO6NT2bx1kywV7HqBm
	F8g3lmNOudUtjfTMAEDwF3PvxiFGFzssRBQX+K634y2YalMue524UzD3hd6II=
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr132974085ad.8.1788404807892;
        Wed, 02 Sep 2026 20:06:47 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe0cf327sm2889785ad.11.2026.09.02.20.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:06:47 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 10/12] selftests/damon/sysfs.sh: test hugepage_mem_bp quota goal
Date: Thu,  3 Sep 2026 11:06:38 +0800
Message-ID: <20260903030639.321705-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-11-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:43 -0700 SJ Park <sj@kernel.org> wrote:

> DAMON sysfs quota goal target_metric file now accepts 'hugepage_mem_bp'
> input.  Test it is accepted in fundamental DAMON sysfs file operation
> selftest.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  tools/testing/selftests/damon/sysfs.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/damon/sysfs.sh b/tools/testing/selftests/damon/sysfs.sh
> index ddebde6edabe4..b66593c9ac471 100755
> --- a/tools/testing/selftests/damon/sysfs.sh
> +++ b/tools/testing/selftests/damon/sysfs.sh
> @@ -210,6 +210,7 @@ test_goal()
>  	ensure_write_succ "$fpath" "active_mem_bp" "valid input"
>  	ensure_write_succ "$fpath" "inactive_mem_bp" "valid input"
>  	ensure_write_succ "$fpath" "node_eligible_mem_bp" "valid input"
> +	ensure_write_succ "$fpath" "hugepage_mem_bp" "valid input"
>  	ensure_write_fail "$fpath" "foo" "invalid input"
>  	ensure_file "$goal_dir/nid" "exist" "600"
>  	ensure_file "$goal_dir/path" "exist" "600"
> -- 
> 2.47.3
> 

The added test correctly covers the
hugepage_mem_bp quota goal.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

Sent using hkml (https://github.com/sjp38/hackermail)
