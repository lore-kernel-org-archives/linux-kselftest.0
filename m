From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 22 Feb 2019 15:05:51 -0800
Subject: [PATCH v10 07/12] fs, arm64: untag user pointers in
 fs/userfaultfd.c
In-Reply-To: <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
Message-ID: <73f2f3fe-9a66-22a1-5aae-c282779a75f5@intel.com>

On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> userfaultfd_register() and userfaultfd_unregister() use provided user
> pointers for vma lookups, which can only by done with untagged pointers.

So, we have to patch all these sites before the tagged values get to the
point of hitting the vma lookup functions.  Dumb question: Why don't we
just patch the vma lookup functions themselves instead of all of these
callers?
