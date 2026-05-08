Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B237FF76
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265254; cv=none; b=TtVUdO+fYISBJ17sLOeEJhpm21v5QyzV7pQDMQO76XmGnzjsOjeJp/+n2jR9xgA0Ftx6BdPsv18WCjL8VIu8ODfpGc6cfm/N/go+iCGmiUOvXL1V21DwMfNtIbOxxXgjJ7QQASIIPyqG/OhbCBwWoZ0OcM3AnngeJzpAFR327pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265254; c=relaxed/simple;
	bh=NEJ9Fh2AWUxXw9PAG8YhIlPQniJqorwmdhhK4SdqJmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9fSRgYy8OLfMjVX2wAKvSZv8oaMr/nQe1hH1viITIQrUWRZ7/sq9n6hiLThXeLUNEJ0S8IjPEUT9AalRREjQaXiFxw1GOIMtqhSPKV23d28RHO62FEzW/DPHUvqkVcDGhhgIZ0ZViXtqO+FwMNtRiYND7nVLxMG9ix1QDlOP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5zKg8TY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5zKg8TY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197C4C2BCF6
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265254;
	bh=NEJ9Fh2AWUxXw9PAG8YhIlPQniJqorwmdhhK4SdqJmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a5zKg8TYmPfxZaDlC+m6nxhtQF6rGdoRA6FntLDUz7UspcQwoFgZ4izmrIVHYzuT7
	 nTy/+UIAOPChWM+8IxsVUOyABIRhOrfgGo2fOqcLkEIETE/pvnv4SFwkLe/5VHQjbk
	 euf09+9GYRlPb9WXO2xIHCMEIEjYwdlCXYMUr3Gq8cICXbGA89mAu+bh14lpkmT9zz
	 LohS7dwZRvJ4B7z6skL2RswKEOVPFtBkkNciN2tcSUO8lbRwJYze8599oKNy1Uo4ut
	 nlfYLeZANuq+gFgVrYyMeRB40jWXbmhXppFloA43E4sLSnc6t4P4PS2uXqvCsyzXh2
	 6WtTcwk37MM1w==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941762394aso397960766b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 11:34:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ehMYLABGh9zw7PuIe1DUuhv+8eaNmCA+x8qzqJ8nYOnb0e9W46pY0j7Oac/PaduCcxlh8aDcvQNsODiWRGU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPvd78s6tOwoXGx+iJydBYXf+Go5+pMP+7eQ9V9sgkhVOBrQx
	pYcOs2/Ps+22mf5ciHj3ZUxwb1iyE44Lb/m5tmAgRanbZxweAKLqaSGDOj3WnijDNnOIbuZdzhn
	i4vvms7InPw24y2nbXiBnrxPY8vwrNss=
X-Received: by 2002:a17:907:3f0f:b0:bc7:efc0:9624 with SMTP id
 a640c23a62f3a-bc7efc09813mr541896466b.44.1778265252918; Fri, 08 May 2026
 11:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505152228.124065-1-pratmal@google.com>
In-Reply-To: <20260505152228.124065-1-pratmal@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 8 May 2026 11:34:01 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMWmk3HdJOW=DbtCoZrTjjFJ-ErAwOvG=8qG9bL00Xwyw@mail.gmail.com>
X-Gm-Features: AVHnY4LJlDj7BVfDj2mmsuAiQvedaub0NNdj5hn8vKWDan1KM4zX78oocFXMTC0
Message-ID: <CAO9r8zMWmk3HdJOW=DbtCoZrTjjFJ-ErAwOvG=8qG9bL00Xwyw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/mm: use pattern matching in .gitignore
To: pratmal@google.com
Cc: akpm@linux-foundation.org, shuah@kernel.org, yosryahmed@google.com, 
	david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 8:22=E2=80=AFAM <pratmal@google.com> wrote:
>
> From: Pratyush Mallick <pratmal@google.com>
>
> The current .gitignore hardcodes each generated test binary by name,
> requiring updates every time a new test is added.
>
> Switch to the patten-matching approach similar to KVM:selftests.
> Ignore everything by default and then allow source extensions (.c, .h, .s=
h)
> and tracked non-source files.
>
> To avoid un-ignoring the generated headers, rename local_config.h to
> local_config.h_gen.
>
> Acked-by: Lorenzo Stoakes <ljs@kernel.org>
> Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
> Reviewed-by: David Hildenbrand <david@kernel.org>

I think these need to be sorted out (as I mentioned privately).

Also, we probably need to split this into two patches: one renaming
local_config.h and one updating .gitignore.
