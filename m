Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706C2EEE7E
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909883; cv=pass; b=jI4tNa4Lh3M4i96TvrKGKiag0q58xR8vYbjyZRF/+hKfB6/hNFpDNnMVEhw50cY6nJ2seBGsqnJ5lwgTn83Q28DdP29EQVcKoLOld2jRAm9OgaV99+KMjqfXu7K5dpR5Vp1kA5l0DTeFjoGmebyw8NkCO2sa4QEd6sb/rDe9KqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909883; c=relaxed/simple;
	bh=BUX/j6GF6XPucpJCZBKJcMPFmpJb+KNmwo1Z/5+yXsg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2SDl0tsJi4qzfqRc4CLWeFPjFlZF2YcJV4DRpwX/0woRi7Mmx2hZPfTd9ismQJZvz08S+vB7GoVYTHNHCYQbamBiM7yz89HtE9bMcEaiMXuD4Yks4OTgYJCwmdQaLrAor4CrwM/H3a8cFrPPYMIoExoOQe180tbUQuT780as+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iciIM+yf; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iciIM+yf"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so6739666d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 16:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788909880; cv=none;
        d=google.com; s=arc-20260327;
        b=VcwE7GY1OkZJSDzsrBI+2vG5EtsZP1ssH8FoJxDSAtmxf/sKHrvPZ3wwo5ZX3t+c7s
         /zS2jO35CYUptpOsuaJptsHlpN0r2qkOSrHhht59QZm9rG9JgkUioIclk3ZycFH8m706
         ELLB9zELpMkF4FoLew8F7JBDb3uaaUgRwGWBxG3CtjNCDuYiSfdLH2UevalJyCF0pBHi
         PNSUkj9eI0beAgTW6xRlecrvglSpnlmiDius9QnKWP3VQN2XwKkc8gle8eM5BX+Cj+Kx
         FEGqcTnUMycTrrct7pj1avFQvcMQKFjIIe/1XaVhoae7Uc/1UoootRSfTM86AeHu4u8G
         4uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        fh=bJLzTFoJJ1rxZ2A+gcesiiB+ihjNJCOfiW09OpJGBCQ=;
        b=CYeoLxC54lOBkzBLm7SBqPIjScU3KXOCfGRbiHxa99A539/lFuxA2voctONc11aWuW
         bfS6rRhO62hJGucXGEQl8yrV6CZ96pzOhe43onJ4bfCsV3RbxM1Ba7Q7sIlXnrwclJN5
         WyqRvriYnAnDHLDh+0LdcNYncxJ8AA7oBi5d/aE4HIgVIZaMKfqA/15pku5USxm6jgQd
         I/5hUndSeV8x9BeeEB1jOBAFKEY9M1ZSfCDkYJYB88Pr4X6/ZSj8CjJdv3SjwYj1m32O
         QVx2P7klbTTl+Gv5/1EBCqcfwUnGVBw3FfOOCQfRv28Bej8Re9CnlKx7q7t+26FYuD8k
         oD8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788909880; x=1789514680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=iciIM+yfT1AHLW24zESpQnkRY48v0FlVHuK+O44tSw3v5Q8vshEESBTu6M/HGC+WzZ
         +utQ+MZF4vB2yVzggnhBIZi+dMZsVlXDucj6O4c1yMEYbaVzuHVXUyg6PMfobS0nf+c/
         cG4MiKp9YUskVAcj1Nkkn3N2l1svvSd7YbtfD4NXp+gvxuV7TwmWnQYn79yYUBshgTXe
         tO9c4oTY1JhkPa5m4jfXKWxaVbdGIi+m5TSCHeqziMqqYxl+R0NqBJd/OTjOXfCwqib/
         ie/Oc0k3pm3AIwgNbPb953Ho3ObLsb+FE6kGtvRlgoSs2iF+50QjsChG/Q5fxVVM75VW
         LiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909880; x=1789514680;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=clokfATjzjV+BffPVEXbyQo4ATKE3vK3RX1sjkaYeA71i/wDP094KC9w0nXO0k9hZk
         xYIM2DajQm4Sfd33oy7STsPvsc+SGJOYOCxd/Bbz5Isuvlvck//DfIT7qW+KCB/wRUks
         mLRi0bcUaANMoymxyPdoc6tpLyz9j2SYJQea9Gn/mmyWmmM8AALdbR0cPQ/VmMj3oka+
         1hwA6UdcmsI/T5y/6Vk+LmAu/4+3vUzJRQqhLsBknP/WPxIs4b/tq2qM9axz0xSqfzg4
         f6x5joG1pPjmMYY8mYNjQSXlVH0FYsTNxcv4ccz9ZXNJMfsjwCUApRVBBKTqWpw6Nn4N
         wORQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB7d9DA5BpbJYeNuTamtWIAeL3hiJlKgmDDc0g5mSkVINkPBzyGTCtMDAbjn+qgNunqVqQWienKJSZaKMhDmc=@vger.kernel.org
X-Gm-Message-State: AFuF++mteIudIeB5OnRxhb22dwe8kJRd/OWmP+ODBpeWgJeN2t0SG2E5
	7cT07dEuhrOD6Fdq8PbEZ9IL6lmby2hs46Fmlaxlj/MOrHssOYWMMMZaKwOYvrXykBkrFAXBeeZ
	7b8VUYCC2h9kGCtexTQFuF5zK06R5j2X7G7w2k0hj
X-Gm-Gg: AYBFou13fz7CgDdLTUonwkTyq1olczqsRCLrnlVmobb/M9fLe4ChGWcejqjYacP2if3
	p1MCTYyfNFta0dVDkw2fJABlnHgF/jAMsi6rWDdDKC2Ygi0ct/+ftKK6BGwWaqavgcpenny4rI4
	ReY4v/qf/pVsr8fiHnK5FoubUwo5ummzrkSKwf5oNZjh6Diwufw3E0FjVk7/irxBaIZFf9f5ubn
	owcwh8KbKDaaxGknbcZtrEkV+r6wb8m4Tzb2CqgtrKl543VvFBdNVd0zKxJ0cYStPUtoWMNjaD8
	UThS8G7PuVsfNY8/fECm6VN1KCg9mp2XTuEqNWl0WCp52jPuqwc9ko3yNklqOfPYXjb77OHmMxm
	KDl8YyjFSG3pV0r5h9/HnEZ5Jr6z1m04=
X-Received: by 2002:a05:6214:4a09:b0:90e:7de2:d81f with SMTP id
 6a1803df08f44-9106b407918mr47732286d6.20.1788909879267; Tue, 08 Sep 2026
 16:24:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-19-15ad654a50db@google.com> <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 16:24:38 -0700
X-Gm-Features: AcwNN1UULNTPjF9-p9AmAvuYgtyt3ObShfxcFD10uTDSDoS21CnWX7JfXOpZMy0
Message-ID: <CAEvNRgHE-c09hdeLqkUfGdnrAUkENuSrdNqByXBYr3N=HSbB_A@mail.gmail.com>
Subject: Re: [PATCH v14 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/23/2026 7:13 AM, Lisa Wang wrote:
>> From: Sagi Shahar <sagis@google.com>
>>
>> Finalize TDX VM after creation to make it runnable.
>
> The changelog is too weak.
>

Some other points I can think of (Xiaoyao, please add on!):

+ Why was kvm_arch_vm_finalize_vcpus() was picked as the lifecycle hook
  in which to finalize the VM? (See comments from the earlier revision
  from Sean) What are the rejected alternatives?
+ Expand on "make it runnable": finalizing also performs measurements

Just confirming: Peter, you meant to add the () at the end of
kvm_arch_vm_finalize_vcpus in the commit subject, right?

>>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> ---
>>   tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
>> index 4b97a9a1bb5e..8319ae3d9fe6 100644
>> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
>> @@ -1489,6 +1489,12 @@ bool kvm_arch_has_default_irqchip(void)
>>   	return true;
>>   }
>>
>> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
>> +{
>> +	if (is_tdx_vm(vm))
>> +		tdx_vm_finalize(vm);
>> +}
>> +
>>   void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
>>   		 const void *smi_handler, size_t handler_size)
>>   {
>>
