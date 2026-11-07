Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081004;
	b=FNStP3v//XomsSxy64EsxU/DMYxNr1sAZAI0jzcnDyPw1XRD5ZjE6QC5jUtCJmFk/lLD
	 /wPL2X4r1V3GQORiB1hWgcGLwUuDg/blM/cHF3E+d118skJG08s03jUAMBlQEpcM5GUg+
	 S1LNdet4EglaTJIbLjvjw907d56Yw1KZS8We5VUIqlKRnMdOErakWUe+HqLi4MqGBzn7O
	 l2nF6CRn+/9ENVobg+lamp293iRb11J7TpddbeZJDRiHSfWwe7MdZoNPMYOLKdsV34Zbd
	 XruzZ4fmxRwbvp5rx8/tBdGLrj4CQJAmQun2LpPBG7VvZXfCtbHcuF4OgcPydB1c9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081004;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SJlOV9BBt4UR6jgbVIiAcYdmTN/stgIBQ5MMHSHMERg=;
	b=TA9WJivEHpK4CXNF7rJ5MmRhd3EKPeZBRSdR6hPbMSuCP9ZWsMpEajhZJs6rKbGyxT56
	 4jhwLgERrG9CBnTiVv9YQJndbu4mq/Gpp1aCqFChmFF44joZHTEBsPp4dqSWxjOwOPuy6
	 7pYd2uzUngPM6bO0YKyaqZWisw175Zxgz7qy4yzLE7ur5ExqLBjGcLtrsiIG0UGobXtf8
	 O5d5tkxW8uI8Hc/IPEYaQ0GhwENp9aU1A4JmJUcQZZvBOG7VJsY7fu9MpASgEGLlaAxjl
	 KNfslWq68CoINwpvFBNG0SAJAjt0iUhauqu+bGEQBhPyZ8aGcfD5PEhonu1KUkoDIOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5VSZ0Eu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19783606A326;
	Sat,  7 Nov 2026 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5VSZ0Eu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2250C1F008A1;
	Sat,  7 Nov 2026 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794081003;
	bh=SJlOV9BBt4UR6jgbVIiAcYdmTN/stgIBQ5MMHSHMERg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I5VSZ0Eu8fHazgOSE6oZODYfX0H4ZqLHG7+cbCIGbNBhsoCRwFXHcUvpl8SuhIvCH
	 QOyRrMyzx83kKD1sT3B2U6KmEnH2yex6XzTp/60nF687YJhfWaDGdj/7z2XrE1Ni0c
	 al7qijHGR1hCtSJ5Kj/8fjo0wviH009lm6nZPds0Hd/bYI07s2aRwMw4hT6Ogzvbdc
	 2O1+O7jpePVCDzjdIQG33uNX0x3513HM6f9au5rdHEs8PDLNQ8LHzIm8jnipBaRIOV
	 Qq5Ghcd4xgrKVdi4AzCFDAI5qmuh1cYnw+P4JZM5AynzTVzes/MIyfxlRgdXgFR9C/
	 +30zo3cl/sc1A==
Message-ID: <21ac345b-1b34-4df5-8dd2-6c57912c661a@kernel.org>
Date: Sat, 7 Nov 2026 20:49:53 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] mm/ksm: align smart scan skips with the scan
 number
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
 <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 17:57, Qiliang Yuan wrote:
> Smart scan skips pages that KSM has failed to de-duplicate for a while.
> Once a page is three scans old, its rmap_item counts down its own number
> of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
> at every ninth scan.
> 
> The unstable tree is rebuilt on every scan, so two identical pages that
> are not in the stable tree yet can only be merged in a scan that looks
> at both. Each countdown runs from when its own page became mergeable, so
> two pages that became mergeable at different times end up on different
> phases and, once both are old, may never be looked at in the same scan
> again. They then stay unmerged for as long as they live. The pairs below
> are counted by making a page mergeable, waiting for 0 to 20 full scans
> before doing the same with an identical page, 20 times for each wait,
> and checking the pair after another 64 full scans, on two boots per
> kernel.
> 
> Pick the skipped scans by the global scan number instead, with periods
> of 2, 4 and 8 scans. The periods being powers of two, every old page is
> looked at on each scan that is a multiple of 8, whatever its age, so any
> two pages meet at least every eighth scan. The longest period goes from
> nine scans to eight, so ksmd looks at more of the pages that never
> merge. The rest of the table is measured on 64M of such pages, median of
> five runs of 256 scans on each of three boots per kernel, CPU time from
> schedstat:
> 
>                               before     after      after/before
>   pairs merged (of 420)       361        420        116%
>                               334        420        126%
>   pages looked at per scan    1792       2048       114%
>   ksmd CPU time per scan      6.30 ms    6.88 ms    109%
>                               6.40 ms    6.96 ms    109%
>                               6.15 ms    6.88 ms    112%
> 
> Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Reviewed-by: Xu Xin <xu.xin@linux.dev>
> ---

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
