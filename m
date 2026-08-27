Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC13332601
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812685; cv=none; b=cw8LMiclpjWDYil6B+lwzWUDkmwAMrdYp5YY1n+y/aY3irqX4AwcDDFwLX7TfFzkHgKhk776ZBIPodQr04ppkmJnp39kokZeIVfCn1fhJnrXiMerTfmPi5oVCmEw8Kl8C3ceNmAGPaiLeh5IVj4ViabKVsSQZyaPKtXkPKTaMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812685; c=relaxed/simple;
	bh=PDX7fTqa9jO07UgQMS3Zh+rMDt02D74EyWmNn8TVu8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOjrKv31dQG9ifTAUBxjmaoouoR/rORZtemTK+levwuQtvui8WCWiBcvZGfYXZyKeeDS/YzBadnMuHXmEjV737yHzcyzSVkdFvHh0EuEqYM9vcSUajQUwikIe29X+yEk0vq0Bk/bNDRtOhUCjyEfDFVfe16z67M2QbWV1mCbyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8bLN7iL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8bLN7iL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07541F01558
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787812683;
	bh=PDX7fTqa9jO07UgQMS3Zh+rMDt02D74EyWmNn8TVu8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I8bLN7iLSRN0WOuTkRUkCAI5TRDmMrsz2qJup/5/JWXmAt89NyrtQUfCiXp1IJAhe
	 s9FhwEXuKn/UGvGWTgdi4Lt6omdwZNp/DMSN1UHhCRZ74Lv0+Z5zhdEzwzilSgntft
	 L2ziaRsoVUY5Nkgire1zSYaH3amQ2OuvTeHqTOEFZ+st/wHSCfWDjRRd7y5JmdM9Sz
	 /AZQxzPFta1hxvU36/Ha7b2+kPTaWHs2jBITYaxAgEBxb+ELbq+JgJ1MMSZM1S+pAc
	 yZuL3tWOeJiSwvVeyK6yNbB542gtxGayK1owEhgRKE6k8lCMLxi2OZIQqAsn412vK7
	 B2kqyRmAzPGQA==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc55e4eb2so1284456d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 23:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrrmQIKEDYUGqRB3jOjg4sI+QA83V750nTRcHZH+G5B0fs0HozXOzMs5aYJtaTBanEUzmFm+TN9LUkhCeru7ko=@vger.kernel.org
X-Gm-Message-State: AFuF++kmie0Ixni6Am918gzLP0Ol6TFjSDszQQa8L5J/Ee1vwY3yGQHX
	psjz9eJYEkhfWIVt25jJIZY5J0Oqtt/QTQRoIdQyTgcBXrBTnQnFX3FdPvduAeTb5zf55ZbDrH/
	J/0+UWoNjoDjcp/FfAlX68aukPUzFh2A=
X-Received: by 2002:a05:6214:20a3:b0:8f0:3b2c:a9c8 with SMTP id
 6a1803df08f44-90cc796a085mr128225816d6.12.1787812682974; Wed, 26 Aug 2026
 23:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 14:37:51 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wfxttrKgwRBpprsES_vjzYsmLzkd7buCkYR8HoEJqCzg@mail.gmail.com>
X-Gm-Features: AcwNN1Vn7Rb2kkRVf6ZzDIKB7z1HE49FN6Lv30_rkBq7LV_rDlQWRjcC3ksW1oQ
Message-ID: <CAGsJ_4wfxttrKgwRBpprsES_vjzYsmLzkd7buCkYR8HoEJqCzg@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:21=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
>
> Nobody after us needs these parts of the argv[0] string anyway.
>
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@=
gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
