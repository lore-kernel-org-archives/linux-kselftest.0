Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182920;
	b=FLs1zo8Iit63KIgwBdZAnL+vjlBU4bXzl5AHXxK1dK5y7+UxCpX7RuWHyM7X/r7JEw7r
	 kerLY1pQls6k1UScpCTldSSVgTcS+CT+gypKZ9dVNWvGIcpDpPT2fj8tKhdfewq0mL04W
	 itRbjLNofK6xQMkgcttqHp2MxcPLHe3hOUWe4uqaLcxhBoOTUa4wMKEiXQhT32mlfPeg0
	 gRmnqDyyB25bECBEF73xbEzYt2JTSfB1opQpBgo6TXBkY6s6Agx+ui6Ng3U1aKmbzTCYN
	 T0p0xUjF0jzx3jS51YZXJGxVwu3lye6R++FpiABNrWIM8xA1EKC9+IhXq7ZOvCcJDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182920;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=K6Ek4iGcbq3vQ07GRWmSQBnPhMgNe+rY+J8oqtO23vE=;
	b=0uHcO/pdJhXHOswwWcfxRHyqOcjB/kDOMlJ4sVukVvq+CGDtA4F5MKc8AfIa5GqeW3rC
	 DOtcb8jE0o2lGc6jmwfyuEza9QLSyxAxY1+pqdLLnwIP4Db6Afh2QCFODOCccw682v/8X
	 IDgvoC4FKiEYOJJledDCUg33IHP65iQeZSAAmgbsy3dBaRBTumON/MG8DZnadnjgsVU1k
	 wLqwXa7URxGZGqZqVI972MC2wjSGDjgSPVSRWmf4WY8wTTntur7oJNA74qgKw4wS1pfh2
	 IRQG7rhsZ2X0edxHcLPmXRi2Sc9z5/yZuPvmHCPwjfL5mDGRcqlcpCXeUl7LNaiB3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnhVylqs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF2606A320;
	Fri, 20 Nov 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnhVylqs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0C91F000CA;
	Fri, 20 Nov 2026 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182919;
	bh=K6Ek4iGcbq3vQ07GRWmSQBnPhMgNe+rY+J8oqtO23vE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cnhVylqs5ES3JxvaYjPvjapckpsryCakLkf58K6cdu/yj6hEpK55l61/r5leNICKo
	 27nkXsy8zKUdCQYesScKFBHbzuGcGSMTih+K4Glwu9mkcllzFD6NIpLxeRhwpSbtMC
	 8Tfec7DkiYTiaSZiSkRmUJmpAOFLegUbO39jNFJfK+g4mT0xpEX0u8r1ziz2VFRy0U
	 gdAk5alXFHUQX3rzuWjGG9rreAoYk7Is3htWwhisfUatj5QU3Jwe0ghmm8AbUKx+GH
	 MNOwscOVMcGYsVJ/tbFp27qzAeWLDbB6s2DJ/r6JsLVSupBwX+z3TmQJqYkNS6URJ/
	 JYvAfbSkIEcpg==
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
Subject: Re: [PATCH v4 13/19] mm/shmem_luo: Allow preserving tmpfs files
In-Reply-To: <20261111002358.1842967-14-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:51 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-14-dmatlack@google.com>
Date: Fri, 20 Nov 2026 13:55:13 +0000
Message-ID: <2vxzld6n1ubi.fsf@kernel.org>
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

> Allow preserving files on tmpfs mounts by dropping the link count check
> from shmem_luo_can_preserve(). The check was meant to limit preservation
> to memfds, which never have links. It isn't needed anymore, since tmpfs
> files are now retrieved into a file on a tmpfs mount.
>
> Userspace can keep using a linked file by its path until the Live
> Update. The path of the file isn't preserved. Userspace creates the file
> to retrieve it into, and can then link that file at the path it wants.
>
> Preserving a linked file affects everyone who opens it by its path,
> since its size is frozen while it is preserved. The permission check
> added by "mm/shmem_luo: Require permission to preserve a file" covers
> that: Callers need permission to write to the file, or must own it if
> its size can't change anyway.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
