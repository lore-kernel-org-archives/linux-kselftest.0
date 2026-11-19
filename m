Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112816;
	b=qObrEoVKGoykWdI6xWFnaiKFQ2Y1sL4p6WqVwWq2atBAOQgfbwYpmx1LuvDGeBzNldyJ
	 xbEeDLuN37BgHnbz8NZ9mz8heizSk+U72BVjPFombY2S0mPD9y4IE+zJvX7/KdFlC5U1h
	 Hcy02HJ6jv9vHCvhIaxLgCJHxcZLrooYLF5y0yf3FKa4dPaLYh3O+4T3qTC9X3JGGfI40
	 SfFgOHN24nSHNTuWcMbMhdVmDnVpas7JPuR56QVKf1V90rBnjHxfkqU6lk3HQDbkCid9O
	 DXzEE5eprJRWvjeReYlQs/Jd8a59cGL8/Trs/zEGrAcqfsT72mgOrRuuV5++awx37TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112816;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=8DZ4mPEBjUmR27wH31ZCXCx6rDwt85HZoDNwiNUBwYs=;
	b=njt5ka0OTuJzcgZAhNlQDlD0Ymh5ru6hKdFDOeCB+YXTgylx4lwXHDuJTVkC/zaysRX2
	 cbL/BZXyYzDnHP52yNY6A3khda5kb3PxSxDrleYh0tkYEPnwpml3u4Qo7WQAmPIE8oLs4
	 PxMnQG/v+3BD03PNKewr/xq3kMeCfglgTPylenDmG1PJbtIrLd3PaDPJrDeOxGL+OAJOL
	 4T4IbxT5q76uic9u93mIX+SyC9+3Tcm3kor8gq8phNMHve8tSw67nmeABGjbUz5LPGTCe
	 1YKnpvYARDg67UB0JtFh8SDuikFvYidtxBiruenw3ZtiKhG5TaU1guQv7YyJ2EZML7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtKR3jM0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE8606A325;
	Thu, 19 Nov 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtKR3jM0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9052C1F000C4;
	Thu, 19 Nov 2026 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795112815;
	bh=8DZ4mPEBjUmR27wH31ZCXCx6rDwt85HZoDNwiNUBwYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FtKR3jM0xbMz1npQDKTHSOZ2Z4Pqwh6sOxEWnBVmzin2nJEBX9dwZ6GQW93/xmHwC
	 tL1SyEGSU6oZwiCIrBfhW/d3dGUvgJQjlW8e+XdOHnmaZ+V9CZacMN74agW4bZascV
	 SOR6QYNhxO5Y+Eq/+XuOO/tH1gJjaPFoxX9grfqpz2ClL6gzRP/nF4LpaJdumhvSkA
	 2fMdt690Sgjg0rYcGIOfqJMiDzjk3DvSkCwAcop2sQQckLPk2uNPl3i4gfU8ia62ky
	 xTVEV5ABSlC5K9ysPF6CKr0yoJqZrO71KwHfANKR0LiDTGtWlM55ThaPE9RQ9VVNLv
	 YgWJbKeiEFdQg==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v4 01/19] liveupdate: Remove the list of steps from
 luo_preserve_file()'s comment
In-Reply-To: <20261111002358.1842967-2-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:39 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-2-dmatlack@google.com>
Date: Thu, 19 Nov 2026 18:26:49 +0000
Message-ID: <2vxzv75s3ceu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 11 2026, David Matlack wrote:

> Remove the numbered list of steps from the kernel-doc comment of
> luo_preserve_file(), along with the sentence that introduces it, which
> repeats the first sentence of the previous paragraph.
>
> The list only restates what the code does, and goes stale whenever the
> code changes.
>
> Suggested-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
