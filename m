Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6C37FF45;
	Sun,  3 May 2026 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826313; cv=none; b=JIlKSYcD6ZvGQ1la0dUfWOu7sgFbDf8d8vRLkkhvEpmMu5Rcu4P+jLO4jULr/SW+CLU9Epppe10j4O/zqhJE/eGWbfW7SgvPftG/mw4pZ00Wo3VqrFliyUfMuDASlGUXAvm5OTaUPihzpZMtvzjlnFZhC6M07WALvLGTFSPVCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826313; c=relaxed/simple;
	bh=DpV1iJHKpivz5duwyrBciaTdSeYDgtFlRa5i6cCWeuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I99Rc6o6pjrXw8MRA52PMokPLPWskyeuoNZX/ATPUwrVqa8WiUX7jy9ZZg8Oxf0q0A9sj+WfIXfufO7yRT6bheqGWW+6Y/8ilvGO84WLV10vqctMVzTrlY3Ru+ldGQJrVnTY80giKnPcexlUHOiwEEdcT3yAw3vHp5Hd6PWXZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=K0RwNUTO; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="K0RwNUTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777826302; bh=qxSFsuPFQC/VGeg6rx/w7eQe0UU5hBkr5mLg7VC6mLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K0RwNUTO/uYR05oQNsqjHo2kM8d2tuRDDOErjj+U3qCknKlIw1PdiN7bf+3yIPjCJ
	 TizjXkNP1vl2sMtO6GNWATV3S80/WaOJ+4SlPrjm7Z4nia0Jg4xkgKpe6bFR4yApKy
	 TDMUiVFTDiF2sKlyjxZkedm/0RsVxt/3yda8c2cc=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 938BA0D7; Mon, 04 May 2026 00:36:56 +0800
X-QQ-mid: xmsmtpt1777826216tdk21x7yo
Message-ID: <tencent_03736D3E0B2A0ACC8F78E08FB0DE3C59C00A@qq.com>
X-QQ-XMAILINFO: M7W7QqjC7ykd6I1CN44wqQVuKhP+FK46w/k+7KdSzcbZjLgs+6eaOFD2SvdA9K
	 +o88Td5/o5xc5vWvmSL0ZA2SqtDvPT1Ei/MX6MUjrnxc0GqdKTb+GoF4pVpZgv285sSl7+s+8cey
	 vL98shZ4uOUclo3/z9qwRjfLt2sAZX8l4ylhu/MEm4zAy1GLfCAY4gdpO3V8fCnRJTnF7IrH/4Xp
	 81KBWPDRDHfbzFh6J1NUNpV9kQ45j7BgIQoZV0W6y8XANN0H4AJTWu6Kx45sT5bS47Qehcjv5RXM
	 ssQ80p1PZSbvZMVMhpGlGW6z+YtE1RRSLxwI4AZwbbGlcgxAIrAs39yI7wPdubXWTJfPNLT4bMBa
	 76bDVQRZVcGWnrlA1r2b8ZWBOTXQxbBcrDgclhxAm3m0ehc8BOgw9kD53pv9PjzBr4jWGuDv6iH7
	 fJXFmgj1MCqXTDz459S7L2TlmBOC8OgI2mxzSnzoVtReRy0bYeOYqmXESr0/BiYJShL4fS3FXYFU
	 xl065CsTTw1rViRGPJzm8UjU00NfwvHVJ5Bpl0jALKOXlUgVMfK7yaLnbAGs1teEMOFA8KP8Gi6R
	 8iLvjzjzAokxX83N+3o04nJ2htj2DZFQKis8ef3v1LvoMznMijD2Zcpp70IVFHDjThmoi08cgaic
	 H7BG7WUD44TuOqk+Aad1tWGiqHRRO6YucmzEm01U7gl0F4Ts0Mbnkf7rL+h6SGR8Zkn7fwCgyy9A
	 vBTiqu/CsF00I2aWfCtIQNWAAJhNL5VUad9sIJDjyDejfT2sKcxsa3bT0sCZDKhee4SMsszrLPSi
	 AUcnFt/5/ZMfG7/pT9xN4vXe5iGxy7dvrchFX3rDwRlTp1IzBbAgnTPXxhtJDEUNgB7rK8GZHA+O
	 C2Xc9+0ldB33ljNgKZWsMEA5HmEgS0/sIUFIDdlPUTf+euNBIVTWP4m3fa92BZka5XS3A63zOMcm
	 kzjGpIj1oHxemJpNoURUGVV4QX1ONAHjm9hSJP1kUwgSsEcDewqmcbd/c3bhvzwWNvaXMKcN9m7i
	 NNfq0pRPiK6ArH0hfic9nsu8ffRmP50UAHJ5jHOXUM73T8TwNB6AnYayUQuTw=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <23c1d65e-257d-4b77-a345-47bbe4bfeec7@qq.com>
Date: Mon, 4 May 2026 00:36:56 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/madvise: reject invalid process_madvise() advice
 for zero-length vectors
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
 <tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>
 <637208e9-9d1c-4e7c-8428-9c3d36e2b7da@kernel.org>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <637208e9-9d1c-4e7c-8428-9c3d36e2b7da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/27/2026 7:49 PM, David Hildenbrand (Arm) wrote:
> On 4/27/26 11:43, fujunjie wrote:
>> process_madvise() used to validate the advice while walking each
>> imported iovec. If the vector has zero total length, vector_madvise()
>> does not enter the loop and can return success without checking whether
>> the advice value is valid.
>>
>> For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
>> process_madvise_remote_valid() check is skipped. As a result, an invalid
>> advice can be reported as success when the vector has zero total length.
>> This differs from madvise(), which rejects an invalid advice before
>> returning success for a zero-length range.
>>
>> Validate the generic madvise behavior at the syscall-facing entry points
>> before any vector walk. In process_madvise(), do this before the
>> remote-only advice restriction so unsupported advice is rejected with the
>> same priority for local and remote mm. Then keep the per-range helper
>> focused on address/length validation, avoiding repeated behavior checks
>> for every iovec.
>>
>> Valid zero-length requests remain no-ops and continue to return 0. Add a
>> selftest that covers invalid advice with a zero-length iovec and an empty
>> vector, while also checking that a valid zero-length request still
>> succeeds.
>>
>> Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
>> Signed-off-by: fujunjie <fujunjie1@qq.com>
>> ---
> 
> 
> Next time, please don't send new revisions as reply to previous submissions.
> 
> Thanks!
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 

Thanks, David. I'll send future revisions as a new thread.

Best regards,
fujunjie

