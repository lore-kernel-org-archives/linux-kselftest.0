Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FF400E1A
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426538; cv=none; b=ibnMSSoCRcwZpi+xuqisSWpCS3cgLfYu6GOuS27VN5fKbs23nOsoJqHdQDBgHVdKUEoYioiKznYa9OwdUQbC0NvRcWkiHC7ifMp6+FvUFbR48Lae15oIALStPy9Rht+tywzPdrECE4Af718ePW9h0eoSPgTy5GOHj5U85q8MDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426538; c=relaxed/simple;
	bh=sKSpzcAytLHXA4fudNRbsNoo9eCHbGh/g0Cikzg2xko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arljSeUKqAdcSqOoFKnIpLyCkFUS2rQdM/0/WaJsJnbZ7BPfRrgsQuSKJmqFn+2JmP/+EXme2q5i8YjL5io9IiewaC7+Ejz9msAgi9X/lWOBP1VSY7DvjD1jav/n4bJCfX2oRLxSPZryKQpxHVLFsFiRFTYcFHlzDwFvuKpyLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd8J9sg+; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd8J9sg+"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso628425a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426537; x=1791031337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3nGMV9CTrwS9xcsel/dvLA5UKRn0rUB5yA3qbzghtk=;
        b=kd8J9sg+hluqCmn30umpq2e80BaHGjSnXl4nd6kPa8CUqaMtGZpm5TbdsIoaKJQfUp
         KxpLJnt/vYzskNQPy8Y5sJDxXfEUv15r2YcTPZlLJbMyYe6tyikGamGrXgQyV25Yd2O2
         OGMlEhqoee+tSTTet/uNWE5iTXVnAeNmf+dtSk/AlwMBzPYlvR7R5WXqpIrjMP34YilW
         mp4+llubzXqs51opDDTt4aFH3g54cl3MgrJXCGMNAj9HSRVJP6NM0tVPq5MqCkEJbnzO
         wirSDO/TPyMuSF8PyD2gWjFJsXkmzzUGDFshRAigdufcb4MCEy5spZpMSlBWyoJWSmQM
         iagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426537; x=1791031337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3nGMV9CTrwS9xcsel/dvLA5UKRn0rUB5yA3qbzghtk=;
        b=xEIED7l1yapkRPsCNbm/vlzlKOFiFrEIjNDfa71uthWsP8mjU6M6mfW6/2pkpjL439
         nt3g2KkAEyJ8LdvaK0JR9K+vnPYUkb1dDng7thLzU0qYmyhGfsX3tNW/dXTNrUQNnPkI
         sHdQ8Qe9RfViqpIQdIqfSo6k2HnY0p79xS9ei9zEc01Ocn3xs2lV+auaZ832pscoXTct
         Q+XacJIv+BSpQx1OcJbXvQDDJmOQKRpUSK3PFNL8Jis7v6qHP3mJNQCt/P8FuR9SeRuU
         a1GB1wpV5HgyBFafSNKhz/PTGAETvt2o+UKpkM0byqvYkDcwy0bHQ+NGqYE+pcx6uFTl
         4zZg==
X-Forwarded-Encrypted: i=1; AKwUvByay4hywln8AZmCg+MkHB94xuZy/uovPK3szCZu6Bo9NUZeUC2bljJIU2ZnJqs7Jxe7iU0Zmg1fm8o45sB/frY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8C1g1YK0EJt+rs/xlocYBHMrRKjhZnF+PXlWpwza3p/z7sopO
	lDzylOObbx9JTEUyBmvGRxQbbwpbu4/NNAArIy+C5sn6rPF6qOMtWfQ=
X-Gm-Gg: AYBFou1nZIp55S8DXYXskEQS8MmmGr3g8L7DE2r9O8P1qds5qdZJUxKUk4VK37o1Vlm
	e3QypEvOoiVHkHUox5goUfLr2VWOh4SBO1/69+U9BWzYYnYBRzz3QU5cBp8tzU0GwDB9NnLMpI3
	PHNCjBbodBQFotjxl+Khxfn+1jSCDCjFzA5qLWUk4LRcWcyzivF22BiUFfGBIOYLq6dmbQvB8hx
	YwEVRyCdD8y3cB0DFz6MnBWYdCRTxZx95nWqYDu9IhZBJ5P3L0aat9MNfINbhzwF3D7BeYt05sO
	goCMNPk9KKQC6P3rOxwTC+XdRa35aLDHI5rOHQaQeA+THEcc75uD3aTCMav3esHPPytV+EkkmSf
	5NOyDc7suS21XM8YkraGPw6AF4TiZxY6YXDTfpkRx5y/2p7YMtMLJjwW53Hf00w3WqIUyBqQ7Gl
	jp06oOlWvXpnALWLiME2Z4hmrh59QHlcmP7EtL9FaXGrzsJqihIixHNhSWfkoKZ4P81esfsf1n6
	I/+evtHGyEJOUdLWQz2RC5U
X-Received: by 2002:a17:90b:254e:b0:39e:6a81:f351 with SMTP id 98e67ed59e1d1-3a098bb66b0mr6996915a91.43.1790426536797;
        Sat, 26 Sep 2026 05:42:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm16337350a91.12.2026.09.26.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:42:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 21:42:10 +0900
Message-ID: <20260926124210.2878601-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com> <20260925042907.2330519-2-donggeunyoo.kernel@gmail.com> <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 21:48:11 -0700, Andrew Morton wrote:
> When fixing a bug, please always fully describe the userspace-visible
> effects of that bug.

Done in v3:
https://lore.kernel.org/all/20260926124145.2878520-1-donggeunyoo.kernel@gmail.com/

> Great!  Please add a prompt to LLM's .md ensuring that future
> changelogs always provide this information.

Added.

Thanks,
Donggeun
