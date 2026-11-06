Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991141;
	b=g8ZzG9lwlI7C4LZ2zLbNKPsVtCcLBhPOalHIzRCtG1PnYFHjiZIN3Svs52uprvIko76t
	 STNf/5Uo9PAwsRwT5/iDk4QaJ4wGhT9N9S0gVZ7bEcqYruspQP1YdN/QH8nZcZ6Ry+VRw
	 0MXMW+uRUDxd7bwDnd5Iiu9j4ySw5+YGD9Nf/5cd4x4OcnJaljOxUCfkN8U10gJikD843
	 9EbLnFsQ+Hn0KKmaXmpMzxFWn6C6JY3VPOalqntRjG/wfNyr2HAoMdSwgEJouXcroGR46
	 Zh9vVQJg8R+VnD18nDfhwANqPZ1pkEs17kgMLGggF1U7po0fIFS/1wvKagGOtStSElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991141;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NFADw0Cbc62uc2AMQXbBE+aAZ5zUXNcwZalJhnl+qq4=;
	b=nPQZhgr5ax4U4NoM+/mZZGUPBkm33dQUSUKAmTCl1X46UaTYMQMqzk+pSXBuzmhBLZZE
	 EwXf+tfKlU42kTdC6xaFLE1nsI0M1vDD+n01OqJI+Iuh7hxXRqO1EHSuV378hwoiC9o3l
	 kqugqIGOSVD/eLJzw7tnX9jp4K8DWwi3p5Ie5Oz0ry+TOJBuAPVT6B3f3gBztrYEp2Xpu
	 gmt/muvj+T8P+FksREGzDe0iLLP5nnAKM88NiBWO6bTwHODEypN//ZropdBo4+chKeLm5
	 7FJoyFyPcYkglR4nqnz6unpaWFyw4om2P0A1evkyvHm08eYlLQmxMmq02O0CEnI0D9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRVIXeTF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D52606A32F;
	Fri,  6 Nov 2026 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRVIXeTF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C271F0089F;
	Fri,  6 Nov 2026 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991140;
	bh=NFADw0Cbc62uc2AMQXbBE+aAZ5zUXNcwZalJhnl+qq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DRVIXeTF1sT749plPS8cLEdj0DViZpbNU9EH4dHRWnD6jW9nmx2I2vNXjpgXhOnHW
	 mdFfo56+VtHixkXs07dTROaLypcyVCfRiARhtw57PsjMjffDKVWfSHOrvOysPhwGyU
	 HpHmnOZCC8V0gXXDUKMbrkDluQAaIgS6gbZTSQ/Gf6PMgZk+XW5VLqR3Q1q/Q/wZ4V
	 DCD4IHa4ufOx0lTzESttfe99OzJ29goHvkomprNqBrIjvPT729NVKyF4kooApV2KqE
	 XxQ2KXKkLQAjxx56YNrb2x/zk+ciOh2mCOKw1QgJh3YuCNWgES89z1lyDCcBJ3YtaP
	 sJ0+bmYk08GSg==
From: Sasha Levin <sashal@kernel.org>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
Date: Fri,  6 Nov 2026 13:52:18 -0500
Message-ID: <20261106185218.1766376-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179397467526.9397.17872200045070830000.b4-ty@b4>
References: <20261105171801.2189772-1-sashal@kernel.org> <179397467526.9397.17872200045070830000.b4-ty@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 06 Nov 2026 15:17:55 +0100, David Hildenbrand wrote:
>[1/1] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
>      https://git.kernel.org/mm/core/c/31ea5515

Thanks! It looks like this one landed on both thp-7.5.misc and
core-7.5.misc:

  31ea5515bf59 ("selftests/mm: add CONFIG_DEBUG_FS to the config fragment")
  194b63198811 ("selftests/mm: add CONFIG_DEBUG_FS to the config fragment")

Was the thp-7.5.misc one meant to be the split_huge_page_test skip patch?

  https://lore.kernel.org/all/20261105030242.1241448-1-sashal@kernel.org/

--
Thanks,
Sasha
