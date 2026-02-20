Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1E2E54B3
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578547; cv=none; b=cZMAD4ZkaRCePvNVt7f8vOJZuCOAm1rpW30uL+1jE57X3WAbGAu4RiPx/Aojfm3avYyhxy4Cr4s5qol1FR/YuuoateVtCVB/0mqv0uRFOQvU/LU1EcYrSzatcz4d0iX15x7l/UF+Q6fuRvnurHU57tRhq+IVf4IYhaZj5Dmh+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578547; c=relaxed/simple;
	bh=W/uz2T87r9U3hpaetbdjaYKd/rLTOIiMqSbbCdADBng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlf1IgqWXs78crP2rzbsff8iLfWuRogGYNcM6ngUAaqYhJ4oeQLJQ2AEqOFQpQQtoMVO6nrud3JdnueHuda0XyEHqjXQCVuscNRgfBifj1N8vGI6L/NPOPha6kQQVBruzI1RgiQ5aVvy2CWtxirhHQaSweduZtTzH4UY0vTWPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hKgbwYs7; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKgbwYs7"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a885af8ee7so46805ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771578546; x=1772183346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7F8WxQjk8Orm8VMuPYwxSvcxytWiyPGbiUS8y914NAU=;
        b=hKgbwYs7MM+uFJzdVuXDs+POHN2edZJITtcmrLqYrhASgH55zat3aLJSefUn+b8flK
         MNWVDa1KwjMkksq6G+AAaq5a+cprpu/SbikcPajEo4UybAtNNtsaSQnpW2QIXgdGOsEA
         +fsqNj62tUUlQ8PVOM8w+eBP9DNEuuu8TEkJi53QPVCYKx7oozRQPp1NNMvJ497gurs8
         Rm+00NX5CG2G/EyPj+PdFV65YHF0FV54H/33pyi/5faYD6UaTUmv6SgwFWX4DGOEBQCx
         K7SeGU73qO8DQEDHs3SOX47cacY4zDzXgHLDYbsbW/+ko6il4FBQ0wIWiu7hcpqCSM0T
         1Ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771578546; x=1772183346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7F8WxQjk8Orm8VMuPYwxSvcxytWiyPGbiUS8y914NAU=;
        b=Np1QinqdpS7L1vVVMy4sJvP239aWxA1urgk7iR5YBcWqSQPFES0Vo88GUx8tmKV/jx
         i9k3teMb6KqJ+mlIfOXeuPLN7PTvxuus+8ANtIV0AjquQUD7j9FaAQuQ3j2LQbkTz2C3
         Y/QMi5GJCDLfSqLm9KurOzcR8QGodbMwJfNVjMMerP/2yi/+0KHva38lO/Umi8aetXD8
         hqjzN1r6hoJPEWtClEbHXFs26aM3ra47shy+0uG9ZolzLcqwt6KbRSGP2nGo4gZREN6R
         9GctQtVzKCNEQBi3hXjqpBj5qdhWA1g9SMppLxkhr05vLpgMJXqX8LVLzIPmFBM1Sqp6
         uVXg==
X-Forwarded-Encrypted: i=1; AJvYcCW++w2S/ZVz9N1TClY7CCukZi85o8BmFDjKKTvcSfigT28RxO2govrXlHUBO7KjocPCNHmhfm29RUhMloK0/Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhbP6yUqViXYkEEYoFlihIXfFAaUYak7dbulas+k3dHXPVxZG0
	cgMPbyFMH85+13fpnwLWMatNNIz6RSIlbcQ1NgYvUiU+JiAgyxzV+1KVJdKoTtkb4g==
X-Gm-Gg: AZuq6aILjjQdedexCEoktG8/9fkh1DmjeMfNbOx7VEm/R+PdI/VxywGPGjhTOsDtbBr
	nHnzzKb3ZWqqWSYOH6XughLArXMB0jHqtPxK1X08DCKhjgunOpoUs4ploWzsmlCXuqcurU4tufK
	M5z94DSiS9drxn4pXvxThpx9AUFIHix1ZMEjBIP2zythBQHlRczBA0Gg3mQEobVOJkovWkzKDUA
	r2lcSvs1D2d2p3UXTXtw7yB5D38c3EeY6dsuyE/mAud4JKYivPhoTTQDeQVhe6muVSTDe8v5QG6
	JMXIfH8lJ2k+5VSU4zVcn1iSu4ji/xy1le+DTiYKtofVfMpI74SjXPK/DETtqbDs54T4d7Wdbo+
	44QAzEgqXF8XW4wyN+DnNaQA1zaKBNof5ZWDMkqO1lLLnROt/sRHtl+AvfXDSp82kJbo6TQkuk7
	e52MlKHmv2gMVnjkS3NklQKM8J/iMA40rEL85fR+EOe+qH019NFh3olPnCpKU=
X-Received: by 2002:a17:902:d584:b0:294:d42c:ca0f with SMTP id d9443c01a7336-2ad69e114ddmr1743575ad.2.1771578545548;
        Fri, 20 Feb 2026 01:09:05 -0800 (PST)
Received: from google.com (249.53.168.34.bc.googleusercontent.com. [34.168.53.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a3e145sm20081108b3a.16.2026.02.20.01.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:09:04 -0800 (PST)
Date: Fri, 20 Feb 2026 09:09:00 +0000
From: Lisa Wang <wyihan@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, aik@amd.com,
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, bp@alien8.de,
	brauner@kernel.org, chao.p.peng@intel.com,
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net,
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com,
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com,
	jroedel@suse.de, jthoughton@google.com, maobibo@loongson.cn,
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org,
	michael.roth@amd.com, mingo@redhat.com, mlevitsk@redhat.com,
	oupton@kernel.org, pankaj.gupta@amd.com, pbonzini@redhat.com,
	prsampat@amd.com, qperret@google.com, ricarkol@google.com,
	rick.p.edgecombe@intel.com, rientjes@google.com,
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com,
	shuah@kernel.org, steven.price@arm.com, tabba@google.com,
	tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
	willy@infradead.org, yan.y.zhao@intel.com
Subject: Re: [RFC PATCH v2 00/37] guest_memfd: In-place conversion support
Message-ID: <aZgkrJv3FeQCZ2DG@google.com>
References: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>

On Mon, Feb 02, 2026 at 02:36:37PM -0800, Ackerley Tng wrote:
> (resending to fix Message-ID)
> 
> Here's a second revision of guest_memfd In-place conversion support.
> 
> In this version, other than addressing comments from RFCv1 [1], the largest
> change is that guest_memfd now does not avoid participation in LRU; it
> participates in LRU by joining the unevictable list (no change from before this
> series).
> 
> While checking for elevated refcounts during shared to private conversions,
> guest_memfd will now do an lru_add_drain_all() if elevated refcounts were found,
> before concluding that there are true users of the shared folio and erroring
> out.
> 
> I'd still like feedback on these points, if any:
> 
> 1. Having private/shared status stored in a maple tree (Thanks Michael for your
>    support of using maple trees over xarrays for performance! [5]).
> 2. Having a new guest_memfd ioctl (not a vm ioctl) that performs conversions.
> 3. Using ioctls/structs/input attribute similar to the existing vm ioctl
>    KVM_SET_MEMORY_ATTRIBUTES to perform conversions.
> 4. Storing requested attributes directly in the maple tree.
> 5. Using a KVM module-wide param to toggle between setting memory attributes via
>    vm and guest_memfd ioctls (making them mututally exclusive - a single loaded
>    KVM module can only do one of the two.).
> 
> [...snip...]
>
> 
> --
> 2.53.0.rc1.225.gd81095ad13-goog

I’ve tested memory failure handling after applying this series and here’s what
memory_failure() does:

Shared memory: In line with other in-memory filesystems, the memory_failure()
handler unmaps the page if it is currently mapped, and issues a SIGBUS
  - if memory failure was injected with MF_ACTION_REQUIRED or
  - if the test process’s memory corruption kill policy is PR_MCE_KILL_EARLY

Here’s the above, in table form:

| MF_ACTION_REQUIRED | Kill Policy         | Mapped | Dirty | Result: SIGBUS |
|--------------------|---------------------|--------|-------|----------------|
| false              | PR_MCE_KILL_EARLY   | true   | true  | true           |
| false              | PR_MCE_KILL_EARLY   | true   | false | false          |
| false              | PR_MCE_KILL_EARLY   | false  | true  | false          |
| false              | PR_MCE_KILL_EARLY   | false  | false | false          |
| false              | PR_MCE_KILL_LATE    | true   | true  | false          |
| false              | PR_MCE_KILL_LATE    | true   | false | false          |
| false              | PR_MCE_KILL_LATE    | false  | true  | false          |
| false              | PR_MCE_KILL_LATE    | false  | false | false          |
| true               | Any Policy          | true   | true  | true           |
| true               | Any Policy          | true   | false | false          |

(I used MADV_HWPOISON to inject memory failures with MF_ACTION_REQUIRED set, and
there was no way to use MADV_HWPOISON without first mapping the page in. To
inject memory failures without MF_ACTION_REQUIRED set, I used debugfs’
hwpoison/corrupt-pfn.)

Private memory: The handler unmaps the page for the stage 2 page table and does
not issue a SIGBUS - the page is never mapped to the host, since it is private
to the guest.

| MF_ACTION_REQUIRED | Kill Policy         | Mapped | Dirty | Result: SIGBUS |
|--------------------|---------------------|--------|-------|----------------|
| false              | PR_MCE_KILL_EARLY   | false  | true  | false          |
| false              | PR_MCE_KILL_EARLY   | false  | false | false          |
| false              | PR_MCE_KILL_LATE    | false  | true  | false          |
| false              | PR_MCE_KILL_LATE    | false  | false | false          |

(I couldn’t use MADV_HWPOISON since private memory could not be mapped and hence
will not have a userspace address)

I’ll post updated memory failure tests together with the next revision of this
series [1] to fix MF_DELAYED handling on memory failure.

[1] https://lore.kernel.org/all/cover.1760551864.git.wyihan@google.com/T/

