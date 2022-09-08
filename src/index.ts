"use strict";
import path from "path";
export const NVoicePath = path.resolve(__dirname, "../n-voice");

export function getNVoicePath(): string {
	return NVoicePath;
}

