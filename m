Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270131;
	b=PFzw4jxC9x+RpGK3ySNs0h1UDQDKcZOCYio3rxgOf0e9YdjJcYLsG/BphCRXrMt5pdBE
	 iK06ihgZ28UZAwTS6y4pUQ56xvSN76RIOtpgr5eXtn6K/cLbwSK60PKQWUn3Dep6xxdgc
	 bt3ioUZJ2BCUKP9szjUHlZNZ1yzLAEz4YCLlmNaUDsMPzuauUNNKF/H2Rr91xtj8I3Gj9
	 xz5e1QdqrfFOXUCzXw2OWa6QjGz41XIOOVG9xLFXK7MPZD9wOQdB83wWmXJmtyMplJ8fK
	 9fFz93vXsW85LjfHE1bVOtH3DRijnwvGbcuMCM277oHzVWhCd2L2nGXL9gY3L3LSZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
	b=OWUJsd2n/4Rp+60x6OKiC04zFq59UFz8sB/kBiITr0jiy2ROX0fg3We66bhDuW1s3SzE
	 tkTZl1qaodt9A5iTzIiK+TmP6kV82WA6UljK9lezheO/CUa5R3/7wS3W/GN6D0TGM/bj4
	 kJ1xqf/VpoUzOr3lOpsJ6v+eOfUsBJHUWjqU6Xx2sKPcBTJMXrdlcT4Peg5UBVCFxg8kE
	 ppBixvsdqLcnc6OcByLlydiXL6Tq/vlNObMYGbV7A/Kl6OUVi9CJ1g7lJ8rwfjfKwFi29
	 0E977uzLaSlFSZmNhjlWh3yS8Qn1r6JwMf/3wFZ/n0re1ixU/O0HpvZvBopAoI9bP4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLHiFmRK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1C606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLHiFmRK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so318876f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270129; x=1793874929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
        b=FLHiFmRKhs6aQ57aD71jTvzjsCiFe140GiCvw03h8p9tCU/LxQPpTD/CznQGXt6IyC
         S840b28cvdOaRql4iIbJV7Yocz7zbiDBpaEKb3wksBcgmMzYXMkdWMh5Rml0dZAtNx5B
         NRYobEc1tCH6LlMQ63AxJ3FF0mCEHuNWq5GqMZEeSYhLCatYqLlMfqDixzKA2A0vDRac
         iuWbLnexUkVT0TXMIKrBr5rAeyGsGNSwyT7ADIHJ8AV5Mje1PkZ+zwj69jhgp6WwM/GA
         bp4FFfO19/jykqwD9ti9swP86Oj04mnPEccTXejLHgFP3l76gB4Z5f283u/xZiDpOsMl
         +kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270129; x=1793874929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+dOdTKmIbVkiM3lsAF+c1rAUHzJmMdTQfVlB9f5eEM=;
        b=i6lTPtBpG48UurTuw0DhD1My32yzRoNGt8AIAEtoBqLnHJ0StNVeqbA3fz33MSPi5e
         iWtu60lmXfGL8iCM9Nnw7Pi6bh9Nih3iU1SAKVB5h0zKcNYt94UuS0+WMs5+qo+zj0uN
         HqUxvMaJjhTpyq62mKohqsJK3b24IMZ3gytXc0+bphTSCkQcsM08jtVV4gR2X937l1ti
         UoMvypkz/sSmU/EK5Bm5/qjrSvm49bawKuv/JDklriH2nXo6cumrKxVdm+37u0V1gdnX
         bsNXXgwSKJAX1Nd00W8ByspiHGPUR4Xci6ArwNPY3LHbEm3jcIfaVvsIJZKP+/gIAkl9
         uFIA==
X-Forwarded-Encrypted: i=1; AKwUvBy9aF5zxWCIvkwe7SWk8oWN+VLIX9FdNJGh352ITKdDFmjhDmJptMGhibFwe3zsSMtAv5+5UaVaZFWuebR8TuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9QUxyez8V45KgXD0FgSwY0WoV02hzrKu+XfPylqf+T9FEsjs7
	i6HKGYt6fRVXwI/6EXk3fPcAbWfilaEhCpb6NtJnwM0zDwXgAcWCVSNW
X-Gm-Gg: AYBFou3C2F02g/JQynTSul5j8dSuJR/1HrbH+XZrgo/TQa0xMNFv459pNNdpdD4hU0i
	SYccTigU03xD9Au8KiOxIS4wZeOPtNLKdBFmspVXOAuk19UdyV1VNVGySSepb0lwWa+bYAFUm6i
	iAccPjItL1k9IjGCNcP9R/pOMlcdPPRmc3G2CyLovJEQ7qH/KTVfPt+zgaWzvMUOfMmvFNPnNWq
	dc01rsXVV5gR1iHMBTuFMXzyddFMHJRhXhEWU2lP724sMT3j3y0KbtKKBw9z/5gZSc+Qa7kIuh/
	G9WBwsD1E6bntZ3+8OSe8LPi26mnvY1aOaWZ0sfNzJsOiLK07WA6f5UAW+LeT1RJtgdCnHsyzNK
	DAbt0bAhu2BciU1TOY6ZjmRzd0SM+mHpxPnKy/MBPAuIc20n+5dd5ckofES7uWP/oYSBUxo8g6p
	r8P9Cot4xwSQXHpNYYnI9To0E6hQ/G1ldqJfP5637DmpRzsnA7jiv9rYV2s/ZFGPJXsj3aGntNa
	grKDxgHux869ftrXafNcMn/JRyOWYwGfZvvoK5bsJjpOCnLyjctZUuGJitMSBofjMnAoRI4cxlq
	pnJEPyk1ndHgqWT3JQvU92zi5VqyGXI9cds7nSqz/Ky4og==
X-Received: by 2002:a05:6000:2893:b0:48e:5e63:27fb with SMTP id ffacd0b85a97d-48e649b1219mr5739523f8f.20.1793270128547;
        Thu, 29 Oct 2026 03:35:28 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36580278f8f.48.2026.10.29.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:35:27 -0700 (PDT)
Message-ID: <3b80c557-ea63-4d32-8901-3f7939ff541c@gmail.com>
Date: Thu, 29 Oct 2026 11:35:26 +0100
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
Subject: Re: [PATCH v3 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
 <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-2-16ad772850ee@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-2-16ad772850ee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 7:24 AM, Qiliang Yuan wrote:
> run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and
> for the pagecache folio split cases of split_huge_page_test, since
> tmpfs does not give them large pagecache folios.
> 
> It only does so when xfs already shows up in /proc/filesystems. When
> xfs is built as a module that is not loaded yet, the check fails, no
> XFS is created, "khugepaged all:file" is reported as skipped and every
> pagecache folio split case of split_huge_page_test is skipped with "No
> large pagecache folio generated".
> 
> Load xfs with load_module() when it is not registered yet, so that it
> is unloaded again once the script is done. Match xfs as a whole word,
> as "selinuxfs" contains it too, as does "vxfs" on kernels before 7.3,
> and would otherwise skip the load and leave xfs to be loaded by
> mount(). "run_vmtests.sh -t thp" with xfs built as a module and not
> loaded:
> 
>                                         before    after
>   khugepaged all:file                  skipped      run
>   skipped split_huge_page_test cases        43        0
>   xfs loaded after the run                  no       no
>   xfs loaded after the run, with
>   selinuxfs or vxfs registered             yes       no
> 
> Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index e104a9c6fdefb..b422edc2e2664 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -412,7 +412,7 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep -qw xfs /proc/filesystems || load_module xfs; then
>  	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
>  	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
>  	    truncate -s 314572800 ${XFS_IMG}
> 


tested it on x86_64 in qemu with lockdep and DEBUG_VM, xfs as a module
and with SELinux on and off. LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
