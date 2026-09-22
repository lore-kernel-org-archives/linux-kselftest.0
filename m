Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F078545DAD
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081290; cv=none; b=Cz/IYQDDduC0havJRDLOt2tI7L29B7Jziqjge1lDjeO9Ze5NERfJwjLkcZ2RNg4lyjByolpES6dl8keVK7itKiPCXrV+yDfval7q2e2Kf4HTtiqecxUm7uiGS1xLMtAgC9NFBbxd3LufSMQraWIPg3im8xZay59oRT0iH+n6FYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081290; c=relaxed/simple;
	bh=QVFwYIiKUZVL+YjJoBnUJAKPe/wKV4GXCUpDX8JPQGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cecAeNk5LwJK0lOi+rogw539zgyaPHnMHDPcsh0CuEyVmdld/jzBAHWvWztKtfBbGp/euJLkAiaF3YdA6lPpsg6C23Uq2Sa454fnfm44GAUvtYs3rOVXn/7cQlaHyys7n/QVBVO4bbypK2pQ6YU4hJGTHs5WCu3PpRkisNEoegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYsHQOUJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYsHQOUJ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso3195541a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081288; x=1790686088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVFwYIiKUZVL+YjJoBnUJAKPe/wKV4GXCUpDX8JPQGA=;
        b=aYsHQOUJk8gURJi/wRAffvbYAr+oEuDTWRAItRq/qCgXtqxo3hvP3NZs5BSqDmhwmM
         yiXCaIYl9kiVqJmvFS/nH818r5prYUCi0RF5OSTM+8XznXvBcBPnuL2XqcVINEjvCWpt
         t6ahYriwMQ9DmqX97K+Ro58vmGGR7CA0XN60P0BrOFupN+b/cLCST1QaZNaviWJ2uQux
         ESeQazpkBDC8rUXDcQoyAO0mQ01UMV44omwe7b+BgNCp7d3jCrlf+Lb4x5DK4njRe9lA
         dmzKI8iSY3u/4Tp5XuLzMaGVIhnTLMXS3OyrMNk/U+U1sBSnKj+RsmbZS5ZOLUEvJI/t
         Voiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081288; x=1790686088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVFwYIiKUZVL+YjJoBnUJAKPe/wKV4GXCUpDX8JPQGA=;
        b=UEiwFPndoA3M+SCGxzUwaOygTC0WvDkfXNq/vFFiL5LGP5Q2fnZ4orvZOJZv5uBkaP
         Am62STudKntJL27+1ncMxJOeHyllXUoqmuG4+ofPlptOqy861i14DzXM2S3RKF6/lrSr
         TEFmmJyOx5pGpOKv8CnNIBJnu7w48m1NeGN4l0X6f/uXkfhlaPCYN1QC8AsTqkCzBzFs
         V699XFwuGgzuJujF8rzN6m3SX8VUr2GJsCZQq5U6rJyKd+JytMTfzQqt/GfW1QyMJLZq
         DgdbMOMYyXxZIF+lNIeQlEhXdRUqTkpFjzNKlBR5w3xktNOmqH2OXe5b4pbvLJLVdLZG
         Y9FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOhItDhKcQaT5KHcd2hl4z+cVwwBdnFjcNGba+9nf2cephwVnNjv9KD87VPf8do7/zK3yK3O85dcdLmoXdhNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lLGe+UFSEuSFlkKLV+M8eCWNfGADNk9nYN65DFGbkjkl4dyxWb
	cARdVomTOUczzTOt4B8R0Z9G4Koi8ebUbx0M/27OsbvBhOcE4BJP0Jk=
X-Gm-Gg: AYBFou2jn4IRi83KhrYE9USgMAyiRhs111yH9L/ZZHYLxKK0Aq+H/iS9yrSqtiHzVRu
	UzclTMmu/GpQEk8c341dyn1QioYtYBufn4j09WDD5MLWuMJ8XGQIzR01cwNuQJaQ0lZfb9knmpb
	R/rvB4azr8/JazKLmxsnysUC4I2Ifn+Jeu7E/Ej/CA+Id69cv+VvqUCO8L0swbtESmxgs26vgSE
	KiA5zkizvNdEEPGXp3PXEq4I2vkqvZli2MAh61Ns+e7++DKLvF75x8C3yVEvCwXBCTTvsYlErlL
	5fKucszTkdV+kCFfM7DDBpz5T6Pwc3tMm1rqU65WbTGYXrdoFLotEgGQReTudSKMZId7UGyboAs
	B4n53gMERRMLk5aY+0E1VyZpBx2jvwvqket4ZkM+mn9kS8COVGFJZWMFQ0In+sP8DlXXk0J8OIY
	3ZT387DtG0MAsZI3edXTCTXaGnrqImazEpAFHu4D+WKuBeL42X35nKPec2U5gBQYLOUXoO5VbJH
	4UlKdGlv2qyZSyj6LhJOmmkhWzG
X-Received: by 2002:a17:90b:582e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3a0730d0610mr995564a91.12.1790081287829;
        Tue, 22 Sep 2026 05:48:07 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574c49sm3442051a91.8.2026.09.22.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:48:07 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Tue, 22 Sep 2026 21:47:59 +0900
Message-ID: <20260922124759.1676901-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arIj-DZ3BtxMEzLB@kernel.org>
References: <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com> <arIj-DZ3BtxMEzLB@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

I'll rewrite the changelog for readability and add the Assisted-by tag
in v2.
