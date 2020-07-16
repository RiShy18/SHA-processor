#!/usr/bin/env python
# -*- coding: utf-8 -*-
import mif
with open('imageIn.mif') as f:
    mem = mif.load(f)

print(mif.dumps(mem))