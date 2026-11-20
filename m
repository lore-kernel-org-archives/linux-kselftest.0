Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201160;
	b=ozyjIDfxuMmz6MSpJB8yPmckRxF8xQ0rBeml6ie8Vj4TdQyQ/OUDBtmP1nNjyT/wUcvu
	 uuxNwKTjoWpB0B8PZUbJcXn1sMnLBJrsI33Z6wqvTmzjSFsjlVJQxl61jyxstjBf+X+/X
	 sAN71Jwn7oTV9C3DuXWcuGbGFrafbkROK7DM5hXe7bkaSoglvbRadKpJhOEBq6huPTC/H
	 k00LSWwcxMcvvR9qLxX4z8s58WaoDPVKcZVfbLkh5XdHL0JUKHfXvQFVFmeOOPNwFnifF
	 0tYV3mDXm1NZVxiRe9q2K90ujG3054MdVDjvmRSd/6KIWnMOqkMKbbgQ+KS/imMd6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
	b=vR/OVy2IhqaCCrpvgtSCIrHahOEHp5DmKGagznF6TQc+V/JC2dtHkWV1IHVHxttw+PFU
	 EJQMV2LqWgziENZRgt/j/mD7P8Hb2dYlr3jVrfDrxnEL0KdrUs4AoTsxzqUIcA/GMg+1j
	 1VZUVqB+NAen9Mtu8g0b8cewIDCIIJDbcmjfrZ5d+UTP0MsECaYjYYRguvo+4zLzl9rna
	 ZSN+dzgXsVqO4gsCj2PifM06WjkQDYWXMuWKb2my8mPHgq6IqKcLOeqoKmDqyxqIN7i5D
	 xstcXwWSJFr7pU2SW53FUIWQkUdJhUdZqTUwFQknUtw+3/54SaoXE8su4X/JVe0gnFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1160A261B
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB1160A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364d86f7f0so13264221cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795201145; x=1795805945; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=Na8SXjJdGUVWDeqxqwuMR3Udnc3JNjfyk3MTxe3QTRK6WZ76d7I+8tS90Y0CdUuXZA
         ozFtgrB8we5s3tBqJqZcDv80Ku/wbh/GB4PCsBMGwkvpKkzwa34jt1f6hdT26CVXC5UP
         CqXkNaWn5gwOSbAvxEed0NE1PQJozJiRIR7CWvSazN38YSX1t5MjQC7PqbHfNae4SLU2
         cRYRjbxZdeSI2Yb8n7W13IJok9pj2aMDEqWhp8T3dZvqoUOiu0H8ebtzuoxe8RQRnyoe
         2tmTqqK0Yz+5RXyD+Ed2jDx8IyB6oTTNJ8Tf0OYn05H7iul3Rs9K0jNoFETg+lTdYUmT
         Z6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201146; x=1795805946;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=DgDfog5LlcxT7i87MQBSPEZmx6EJ1l1+gG4vzV9UXB7IkCdSiTTqOMfxAr7ikcHFMI
         2VlG6J1zEXYqaLrMeUGJvvR79NESKQA2mzA9F6zBWKBBrufJI8BAVIfWo7cO75SIHxXz
         RUxMyFDbXX8gbvFPPVCa8ffD3jxOCk89slz9AI7Vnn4PqC3TIICG5/z8mMDElNHy7kjb
         DLWWIdmwGBiklkRRG9nx9LzwpENVTvpD5a2i297cFkLdCgJ8O8os32T3P9ohJ4HFp6bK
         co1T0FkHe9Yhf82JcNHEJuDP9Rc6C5QFNsihMj80IxHhJGnWmYp44dY1O7rBcyKz0NXs
         o5JQ==
X-Forwarded-Encrypted: i=1; AL+hErGgIwz+NirMjisqAnGQIdVKPGI7i51dBqaMHer3+Zr2E9HAyVqFPJ3ramFv4cskdWs7MG2R/7aCX99ZJi70v5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zvK+Rrq+cKB1JLEkIjn1BNoSqpXAU3hpZGiFPNaOykjVXdsqu
	N4TtUeDEk7TIWnmJp8e8xRsvTmNLCGhC34v7VZqxIC1BB4hehujg0rt4QbPkoRTTUbQ=
X-Gm-Gg: AYBFou1TGrd+wozehIxzrWxRORs6J7b6wc0RsHJLGIdUIKu+YGk9+VHu6JFIy4okWCM
	XeGCD20QoOnPKRctvkunfYF1bmMW6qaJHSJfUUHtD/YnSo38g1koPp7h0e01HM+rKKpAHl8wjBp
	01Ojib91Vu7xqKTtF5/aDIp3x1y54+q4SK7YmxFhkdnn6q+Y0LihwJe2LzVMk0kBOo7GwvKDnUm
	j6wB61N58VRSwendHyoLbbiRxHBH888WeDlGHmEqz/+AFmEHNaLKtz9Wiavs3MN9iJgn0Fn6HLJ
	cxeayshAj/MCEfGnS6CShwRUjqFtj0S+V5HDVd+CJRLTJYHd+OmMcKNtg27D7SccX+xCAuZVE5U
	IZkiZS/okmbN7AeuQOv3xsG1beogBpE4jIpdMlzZ/DDzQVcDGonK5fQr9U3waAmE8mUsQtkWGPR
	s11UmZicNzyBekM8VNeDIeDKzldhO16bxSAXqF3mc5Ct391DylPua+Y6LtFB5CwoiHv9xwNj3R7
	MQ/Zxm7Oyfd2xLmC54p45DJO16/xt2fSt4ztSfXZUnBwMz1KMjbWua9oZN8PSHWyPM6X4YuiDS9
	bkVMBiOCJBZl7KqA0ptIqzvRdFilZ0H/4BvlBOGZpUTJsNx9sU6oWkEbKDhsZIZ67SfnG/fyD/3
	1yq/3wfw=
X-Received: by 2002:a05:622a:1a89:b0:55d:2c9a:3776 with SMTP id d75a77b69052e-55d76a811c8mr74428711cf.65.1795201145651;
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm30305771cf.21.2026.11.20.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 00/60] Private NUMA nodes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 driver-core@lists.linux.dev, damon@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
Date: Fri, 20 Nov 2026 13:59:03 -0500
Message-Id: <179520114342.412063.6068641130948664600.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 13:08 -0500, Gregory Price (Meta) wrote:
> This is v6 of the Private NUMA node series. The series falls into four
> parts, each building on the one before:
> 
>    1-18  mm: introduce N_MEMORY_COMMON
>   19-26  restrict folio-walking MM services to common memory
>   27-44  N_MEMORY_PRIVATE, kept out of cpusets, mempolicy, accounting
>          and the page allocator's ordinary paths
>   45-61  private node features, memory hotplug of private memory,
>          dax/kmem private mode, selftests and documentation
> 
> Patches 1-26 change no behavior on any system and can be reviewed and
> merged on their own. Without private nodes, every path in patches 27-61
> behaves as before.
> 
> The full stack is also available at:
> https://github.com/gourryinverse/linux/tree/scratch/gourry/managed_nodes/private_nodes_v6
>

Apologies - my b4 prep dropped a commit from the stack because I made
the mistake of filtering on author (myself) and it stripped out this
commit:

https://lore.kernel.org/linux-mm/20260923211041.3127588-4-gourry@gourry.net/

The commit is one the branch listed above, and should be otherwise
indepedent of the series (can be pulled in ahead of everything else).

Sorry for the noise / compilation error, won't happen again.

-- 
~Gregory

