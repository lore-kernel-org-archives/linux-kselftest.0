From: dave.hansen at intel.com (Dave Hansen)
Date: Tue, 26 Feb 2019 09:35:26 -0800
Subject: [PATCH v10 00/12] arm64: untag user pointers passed to the kernel
In-Reply-To: <CAAeHK+xCi2MxaykYWCz9mwbOzNpjrFcHex7B-VXektNNWBT+Hw@mail.gmail.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <2ad5f897-25c0-90cf-f54f-827876873a0a@intel.com>
 <CAAeHK+xCi2MxaykYWCz9mwbOzNpjrFcHex7B-VXektNNWBT+Hw@mail.gmail.com>
Message-ID: <6abc8c6a-c7aa-72ec-8a4e-7dcfeb9ea09b@intel.com>

On 2/26/19 9:18 AM, Andrey Konovalov wrote:
>> This seems like something
>> where we would ideally add an __tagged annotation (or something) to the
>> source tree and then have sparse rules that can look for missed untags.
> This has been suggested before, search for __untagged here [1].
> However there are many places in the kernel where a __user pointer is
> casted into unsigned long and passed further. I'm not sure if it's
> possible apply a __tagged/__untagged kind of attribute to non-pointer
> types, is it?
> 
> [1] https://patchwork.kernel.org/patch/10581535/

I believe we have sparse checking __GFP_* flags.  We also have a gfp_t
for them and I'm unsure whether the sparse support is tied to _that_ or
whether it's just by tagging the type itself as being part of a discrete
address space.
